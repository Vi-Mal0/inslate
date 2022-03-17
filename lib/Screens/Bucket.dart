import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:insuranceprototype/Screens/Dashboard.dart';
import '../HTTP/HttpService.dart';
import '../Model/Candidate.dart';
import '../Model/Quans.dart';

class Bucket extends StatefulWidget {
  int id;
  Bucket(this.id, {Key? key}) : super(key: key);

  @override
  _BucketState createState() => _BucketState();
}

class _BucketState extends State<Bucket> {

  HttpService http = HttpService();

  var studid, numerical, verbal, coding, logical, result, res, e;

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  _openBottomSheet(data) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.white,
      enableDrag: true,
      context: context,
      builder: (BuildContext context) {
        var q = data.quants;
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Numerical Ability",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RatingBar.builder(
                  initialRating: q == null
                      ? 1.0
                      : double.parse(q["numericalAbility"].toString()),
                  minRating: 1,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      numerical = rating;
                    });
                  },
                ),
              ],
            ),
            const Text(
              "Logical reasoning",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RatingBar.builder(
                  initialRating: data.quants == null
                      ? 1
                      : double.parse(
                          data.quants["logicalReasoning"].toString()),
                  minRating: 1,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      logical = rating;
                    });
                  },
                ),
              ],
            ),
            const Text(
              "Verbal Ability",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RatingBar.builder(
                  initialRating: data.quants == null
                      ? 1
                      : double.parse(data.quants["verbalAbility"].toString()),
                  minRating: 1,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      verbal = rating;
                    });
                  },
                ),
              ],
            ),
            const Text(
              "Coding Ability",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RatingBar.builder(
                  initialRating: data.quants == null
                      ? 1
                      : double.parse(
                          data.quants["codingAndDecoding"].toString()),
                  minRating: 1,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      coding = rating;
                    });
                  },
                ),
              ],
            ),
            FutureBuilder(
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  List<String> a = snapshot.data;
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButtonFormField2(
                              value: res?["result"],
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              isExpanded: true,
                              hint: const Text(
                                'Result',
                                style: TextStyle(fontSize: 14),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              buttonPadding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items: a
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  result = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context, true);

                                  http.updateCandidate(
                                      studid, Candidate(currentStatus: result));

                                  http.createQuans(Quans(
                                    id: studid,
                                    numericalAbility: numerical,
                                    verbalAbility: verbal,
                                    codingAndDecoding: coding,
                                    logicalReasoning: logical,
                                    result: result,
                                  ));

                                  _refreshData();
                                },
                                icon: const Icon(Icons.done)))
                      ],
                    ),
                  );
                }
                return const CircularProgressIndicator();
              },
              future: http.getParam('S002'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _refreshData() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (Theme.of(context).brightness == Brightness.dark)
          ? Colors.black
          : Colors.white,
      child: FutureBuilder(
        future: http.getEmployeeByID(widget.id.toString()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data.assignedCandidates.length,
                      padding: const EdgeInsets.only(top: 0.0),
                      itemBuilder: (context, index) {
                        e = snapshot.data.assignedCandidates;

                        retColor() {
                          var clr = snapshot
                              .data.assignedCandidates[index].currentStatus;
                          if (clr == "Assigned") return Colors.cyan;
                          if (clr == "Captured") return Colors.yellow;
                          if (clr == "Passed") return Colors.green;
                          if (clr == "Failed") return Colors.red;
                        }

                        return Slidable(
                          key: UniqueKey(),
                          endActionPane: ActionPane(
                            dismissible: DismissiblePane(onDismissed: (){
                              _openBottomSheet(snapshot
                                  .data.assignedCandidates[index]);

                              setState(() {
                                studid = snapshot
                                    .data.assignedCandidates[index].id;
                                res = snapshot.data
                                    .assignedCandidates[index].quants;
                              });
                            },),
                            motion: const DrawerMotion(),
                            children: [
                              CustomSlidableAction(
                                onPressed: (_){},
                                child: const SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: SizedBox(
                                    height: 150,
                                    width: 200,
                                    child: Card(
                                      color: Color(0xffbe61565),
                                      child: Center(
                                        child: ListTile(
                                          leading: Icon(Icons.rate_review_rounded,color: Colors.white,size: 35,),
                                          title: Text("Add Rating",style: TextStyle(color: Colors.white,fontSize: 18),),
                                        ),
                                      )
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15,0,10,0),
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "name : ${snapshot.data.assignedCandidates[index].name}"),
                                        Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: retColor(),
                                          ),
                                          child: Text(
                                            e?[index].currentStatus,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: 210,
                                            child: Row(
                                              children: [
                                                const Icon(Icons.email_outlined),
                                                const SizedBox(width: 2,),
                                                SizedBox(
                                                  width: 180,
                                                  child: Text(
                                                    snapshot.data.assignedCandidates[index].email,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.phone),
                                            const SizedBox(width: 5,),
                                            Text(
                                                snapshot.data.assignedCandidates[index].mobileNumber,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                            "Qualification : ${snapshot.data.assignedCandidates[index].highestQualification}"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                            "Interview Schedule : ${snapshot.data.assignedCandidates[index].availableDateAndTime}"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Icon(Icons.error),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xffbe61565),
              ),
            );
          }
        },
      ),
    );
  }
}
