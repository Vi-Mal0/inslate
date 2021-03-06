import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:insuranceprototype/Screens/Dashboard.dart';
import 'package:page_transition/page_transition.dart';
import '../HTTP/HttpService.dart';
import '../Model/Candidate.dart';
import '../Model/Quans.dart';
import 'CandidateProfile.dart';

class Bucket extends StatefulWidget {
  int id;
  Bucket(this.id, {Key? key}) : super(key: key);

  @override
  _BucketState createState() => _BucketState();
}

class _BucketState extends State<Bucket> {
  HttpService http = HttpService();

  var studid, numerical, verbal, coding, logical, result, res, e;

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
                                  _refreshData();

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
              future: http.getParam('S0002'),
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
    _refreshData();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Container(
          color: (Theme.of(context).brightness == Brightness.dark)
              ? Colors.black
              : Colors.white,
          child: FutureBuilder(
            future: http.getEmployeeByID(widget.id.toString()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                _refreshData();
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data.assignedCandidates.length,
                          padding: const EdgeInsets.only(top: 0.0),
                          itemBuilder: (context, index) {
                            e = snapshot.data.assignedCandidates;

                            return Slidable(
                              key: UniqueKey(),
                              endActionPane: ActionPane(
                                dismissible: DismissiblePane(
                                  onDismissed: () {
                                    _refreshData();
                                    setState(() {

                                      _openBottomSheet(
                                          snapshot.data.assignedCandidates[index]);
                                      _refreshData();
                                    });


                                    setState(() {
                                      studid = snapshot
                                          .data.assignedCandidates[index].id;
                                      res = snapshot
                                          .data.assignedCandidates[index].quants;
                                    });
                                  },
                                ),
                                motion: const DrawerMotion(),
                                children: [
                                  CustomSlidableAction(
                                    onPressed: (_) {
                                      _refreshData();
                                      setState(() {
                                        _openBottomSheet(snapshot
                                            .data.assignedCandidates[index]);
                                        _refreshData();
                                      });
                                      _refreshData();

                                      setState(() {
                                        studid = snapshot
                                            .data.assignedCandidates[index].id;
                                        res = snapshot.data
                                            .assignedCandidates[index].quants;
                                        _refreshData();
                                      });
                                    },
                                    child: const SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: SizedBox(
                                        height: 150,
                                        width: 200,
                                        child: Card(
                                            color: Color(0xffbe61565),
                                            child: Center(
                                              child: ListTile(
                                                leading: Icon(
                                                  Icons.rate_review_rounded,
                                                  color: Colors.white,
                                                  size: 35,
                                                ),
                                                title: Text(
                                                  "Add Rating",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: CandidateProfile(snapshot.data.assignedCandidates[index].id)));
                                },
                                child: Container(
                                  height: 120,
                                  padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                                  child: Card(
                                    color: index % 2 == 0 ? Colors.white : Colors.grey[200],
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.badge),
                                            Text(
                                                "  ${snapshot.data.assignedCandidates[index].name}"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.email_outlined),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              "  ${snapshot.data.assignedCandidates[index].email}",
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.phone),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "  ${snapshot.data.assignedCandidates[index].mobileNumber}",
                                            ),
                                          ],
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.all(8.0),
                                        //   child: Row(
                                        //     children: [
                                        //       Text(
                                        //           "Qualification : ${snapshot.data.assignedCandidates[index].highestQualification}"),
                                        //     ],
                                        //   ),
                                        // ),
                                        // Padding(
                                        //   padding: const EdgeInsets.all(8.0),
                                        //   child: Row(
                                        //     children: [
                                        //       Text(
                                        //           "Interview Schedule : ${snapshot.data.assignedCandidates[index].availableDateAndTime}"),
                                        //     ],
                                        //   ),
                                        // ),
                                      ],
                                    ),
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
        ),
      ),
    );
  }
}
