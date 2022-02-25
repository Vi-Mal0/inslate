import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:insuranceprototype/Screens/sample.dart';
import 'package:page_transition/page_transition.dart';

import '../HTTP/HttpService.dart';
import '../Model/Candidate.dart';
import '../Model/Quans.dart';
import 'admin/CandidateProfile.dart';

class EmployeeProfile extends StatefulWidget {
  int id;
  EmployeeProfile(this.id,{Key? key}) : super(key: key);

  @override
  _EmployeeProfileState createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> {

  void refreshData() {
  }

  onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  void navigateSecondPage(id) {
    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: CandidateProfile(id))).then(onGoBack);
  }

  HttpService http = HttpService();

  var studid;
  var  numerical;
  var  verbal;
  var  coding;
  var  logical;
  var result;
  var res;
  var e;
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Account'),
          content: FutureBuilder(
            future: http.getEmployee(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Container(
                  width: 300,
                  height: 300,
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Container(color:Colors.grey,height: 70,child: Center(child: InkWell(onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => LandingScreen(snapshot.data[index].employeeId),
                          ),
                        );
                      },child: Card(child: Center(child: Text(snapshot.data[index].employeeName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))))),);
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Icon(Icons.error),);
              } else {
                return Center(child: const CircularProgressIndicator(),);
              }
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: FutureBuilder(
            future: http.getEmployeeByID(widget.id.toString()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   height: 70,
                    //   child: Row(
                    //     children: [
                    //       IconButton(onPressed: (){
                    //         Navigator.pop(context);
                    //       },icon: Icon(Icons.arrow_back),),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: 20,),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     children: [
                    //       Text("Employee id : ${snapshot.data.employeeId}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text("Employee Name : ${snapshot.data.employeeName}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text("Designation : ${snapshot.data.employeeDesignation}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    // ),
                    //   SizedBox(height: 20,),
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                            itemCount: snapshot.data.assignedCandidates.length,
                            padding: const EdgeInsets.only(top: 10.0),
                            itemBuilder: (context, index) {
                              e= snapshot.data.assignedCandidates;

                              retColor(){
                                var clr =snapshot.data.assignedCandidates[index].currentStatus;
                                if(clr == "Assigned"){
                                  return Colors.cyan;
                                }
                                if(clr == "Captured"){
                                  return Colors.yellow;
                                }
                                if(clr == "Passed"){
                                  return Colors.green;
                                }
                                if(clr == "Failed"){
                                  return Colors.red;
                                }
                              }
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    studid = snapshot.data.assignedCandidates[index].id;
                                    res =snapshot.data.assignedCandidates[index].quants;
                                  });
                                  showModalBottomSheet<void>(
                                    enableDrag: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      var q = snapshot.data.assignedCandidates[index].quants;
                                      return Container(
                                        height: 700,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            const SizedBox(height: 20,),
                                            const Text("Numerical Ability",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                RatingBar.builder(
                                                initialRating: q == null ? 1.0 :  double.parse(q["numericalAbility"].toString()),
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  itemCount: 5,
                                                  itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    setState(() {
                                                      numerical = rating;
                                                    });
                                                  },
                                                ),
                                                // Container(
                                                //   height: 40,
                                                //   width: 200,
                                                //   child: TextFormField(
                                                //     decoration: InputDecoration(
                                                //       labelText: "comments",
                                                //       enabledBorder: OutlineInputBorder(
                                                //         borderSide: const BorderSide(
                                                //           color: Colors.grey,
                                                //           width: 1,
                                                //         ),
                                                //         borderRadius: BorderRadius.circular(25.0),
                                                //       ),
                                                //       focusedErrorBorder: OutlineInputBorder(
                                                //         borderSide: const BorderSide(
                                                //           color: Colors.red,
                                                //           width: 1,
                                                //         ),
                                                //         borderRadius: BorderRadius.circular(25.0),
                                                //       ),
                                                //       errorBorder: OutlineInputBorder(
                                                //         borderSide: const BorderSide(
                                                //           color: Colors.red,
                                                //           width: 1,
                                                //         ),
                                                //         borderRadius: BorderRadius.circular(25.0),
                                                //       ),
                                                //       focusedBorder: OutlineInputBorder(
                                                //         borderSide: BorderSide(
                                                //           color: Colors.grey,
                                                //           width: 1,
                                                //         ),
                                                //         borderRadius: BorderRadius.circular(25.0),
                                                //       ),
                                                //     ),
                                                //     validator: (val) {
                                                //       if (val!.isEmpty) {
                                                //         return 'Required';
                                                //       }
                                                //       return null;
                                                //     },
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                            Text("Logical reasoning",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                RatingBar.builder(
                                                initialRating: snapshot.data.assignedCandidates[index].quants == null ?1 :double.parse(snapshot.data.assignedCandidates[index].quants["logicalReasoning"].toString()),
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  itemCount: 5,
                                                  itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {

                                                    setState(() {
                                                      logical = rating;
                                                    });
                                                  },
                                                ),
                                                // Container(
                                                //   height: 40,
                                                //   width: 200,
                                                //   child: TextFormField(
                                                //     decoration: InputDecoration(
                                                //       labelText: "comments",
                                                //       enabledBorder: OutlineInputBorder(
                                                //         borderSide: const BorderSide(
                                                //           color: Colors.grey,
                                                //           width: 1,
                                                //         ),
                                                //         borderRadius: BorderRadius.circular(25.0),
                                                //       ),
                                                //       focusedErrorBorder: OutlineInputBorder(
                                                //         borderSide: const BorderSide(
                                                //           color: Colors.red,
                                                //           width: 1,
                                                //         ),
                                                //         borderRadius: BorderRadius.circular(25.0),
                                                //       ),
                                                //       errorBorder: OutlineInputBorder(
                                                //         borderSide: const BorderSide(
                                                //           color: Colors.red,
                                                //           width: 1,
                                                //         ),
                                                //         borderRadius: BorderRadius.circular(25.0),
                                                //       ),
                                                //       focusedBorder: OutlineInputBorder(
                                                //         borderSide: BorderSide(
                                                //           color: Colors.grey,
                                                //           width: 1,
                                                //         ),
                                                //         borderRadius: BorderRadius.circular(25.0),
                                                //       ),
                                                //     ),
                                                //     validator: (val) {
                                                //       if (val!.isEmpty) {
                                                //         return 'Required';
                                                //       }
                                                //       return null;
                                                //     },
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                            Text("Verbal Ability",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                RatingBar.builder(
                                                initialRating:snapshot.data.assignedCandidates[index].quants == null ? 1:double.parse(snapshot.data.assignedCandidates[index].quants["verbalAbility"].toString()),
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  itemCount: 5,
                                                  itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {

                                                    setState(() {
                                                      verbal = rating;
                                                    });
                                                  },
                                                ),
                                                // Container(
                                                //   height: 40,
                                                //   width: 200,
                                                //   child: TextFormField(
                                                //     decoration: InputDecoration(
                                                //       labelText: "comments",
                                                //       enabledBorder: OutlineInputBorder(
                                                //         borderSide: const BorderSide(
                                                //           color: Colors.grey,
                                                //           width: 1,
                                                //         ),
                                                //         borderRadius: BorderRadius.circular(25.0),
                                                //       ),
                                                //       focusedErrorBorder: OutlineInputBorder(
                                                //         borderSide: const BorderSide(
                                                //           color: Colors.red,
                                                //           width: 1,
                                                //         ),
                                                //         borderRadius: BorderRadius.circular(25.0),
                                                //       ),
                                                //       errorBorder: OutlineInputBorder(
                                                //         borderSide: const BorderSide(
                                                //           color: Colors.red,
                                                //           width: 1,
                                                //         ),
                                                //         borderRadius: BorderRadius.circular(25.0),
                                                //       ),
                                                //       focusedBorder: OutlineInputBorder(
                                                //         borderSide: BorderSide(
                                                //           color: Colors.grey,
                                                //           width: 1,
                                                //         ),
                                                //         borderRadius: BorderRadius.circular(25.0),
                                                //       ),
                                                //     ),
                                                //     validator: (val) {
                                                //       if (val!.isEmpty) {
                                                //         return 'Required';
                                                //       }
                                                //       return null;
                                                //     },
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                            Text("Coding Ability",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                RatingBar.builder(
                                                initialRating: snapshot.data.assignedCandidates[index].quants == null ? 1: double.parse(snapshot.data.assignedCandidates[index].quants["codingAndDecoding"].toString()),
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  itemCount: 5,
                                                  itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    setState(() {
                                                      coding = rating;
                                                    });
                                                  },
                                                ),
                                                // Container(
                                                //   height: 40,
                                                //   width: 200,
                                                //   child: TextFormField(
                                                //     decoration: InputDecoration(
                                                //       labelText: "comments",
                                                //       enabledBorder: OutlineInputBorder(
                                                //         borderSide: const BorderSide(
                                                //           color: Colors.grey,
                                                //           width: 1,
                                                //         ),
                                                //         borderRadius: BorderRadius.circular(25.0),
                                                //       ),
                                                //       focusedErrorBorder: OutlineInputBorder(
                                                //         borderSide: const BorderSide(
                                                //           color: Colors.red,
                                                //           width: 1,
                                                //         ),
                                                //         borderRadius: BorderRadius.circular(25.0),
                                                //       ),
                                                //       errorBorder: OutlineInputBorder(
                                                //         borderSide: const BorderSide(
                                                //           color: Colors.red,
                                                //           width: 1,
                                                //         ),
                                                //         borderRadius: BorderRadius.circular(25.0),
                                                //       ),
                                                //       focusedBorder: OutlineInputBorder(
                                                //         borderSide: BorderSide(
                                                //           color: Colors.grey,
                                                //           width: 1,
                                                //         ),
                                                //         borderRadius: BorderRadius.circular(25.0),
                                                //       ),
                                                //     ),
                                                //     validator: (val) {
                                                //       if (val!.isEmpty) {
                                                //         return 'Required';
                                                //       }
                                                //       return null;
                                                //     },
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                            // Text("Overall Rating",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                            // Row(
                                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            //   children: [
                                            //     RatingBar.builder(
                                            //     initialRating: 3,
                                            //       minRating: 1,
                                            //       direction: Axis.horizontal,
                                            //       itemCount: 5,
                                            //       itemBuilder: (context, _) => const Icon(
                                            //         Icons.star,
                                            //         color: Colors.amber,
                                            //       ),
                                            //       onRatingUpdate: (rating) {
                                            //         print(rating);
                                            //       },
                                            //     ),
                                            //     Container(
                                            //       height: 40,
                                            //       width: 200,
                                            //       child: TextFormField(
                                            //         decoration: InputDecoration(
                                            //           labelText: "comments",
                                            //           enabledBorder: OutlineInputBorder(
                                            //             borderSide: const BorderSide(
                                            //               color: Colors.grey,
                                            //               width: 1,
                                            //             ),
                                            //             borderRadius: BorderRadius.circular(25.0),
                                            //           ),
                                            //           focusedErrorBorder: OutlineInputBorder(
                                            //             borderSide: const BorderSide(
                                            //               color: Colors.red,
                                            //               width: 1,
                                            //             ),
                                            //             borderRadius: BorderRadius.circular(25.0),
                                            //           ),
                                            //           errorBorder: OutlineInputBorder(
                                            //             borderSide: const BorderSide(
                                            //               color: Colors.red,
                                            //               width: 1,
                                            //             ),
                                            //             borderRadius: BorderRadius.circular(25.0),
                                            //           ),
                                            //           focusedBorder: OutlineInputBorder(
                                            //             borderSide: BorderSide(
                                            //               color: Colors.grey,
                                            //               width: 1,
                                            //             ),
                                            //             borderRadius: BorderRadius.circular(25.0),
                                            //           ),
                                            //         ),
                                            //         validator: (val) {
                                            //           if (val!.isEmpty) {
                                            //             return 'Required';
                                            //           }
                                            //           return null;
                                            //         },
                                            //       ),
                                            //     ),
                                            //   ],
                                            // ),
                                            FutureBuilder(
                                              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                                                List<String> a;

                                                if(snapshot.hasData){
                                                  a=snapshot.data;
                                                }
                                                else{
                                                  a=["api errror"];
                                                }                  return Padding(
                                                  padding: const EdgeInsets.fromLTRB(20,0,0,0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Container(
                                                        width: 300,
                                                        height: 70,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child:   DropdownButtonFormField2(
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
                                                            buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                                            dropdownDecoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            items: a.map((item) =>
                                                                DropdownMenuItem<String>(
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
                                                            onSaved: (value) {
                                                              setState(() {
                                                                result = value.toString();
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      Container(decoration: BoxDecoration(
                                                        color: Colors.amber,
                                                          border: Border.all(
                                                            color: Colors.black,
                                                          ),
                                                          borderRadius: BorderRadius.all(Radius.circular(20))
                                                      ),child: IconButton(
                                                          onPressed: (){
                                                            Navigator.pop(context);
                                                            http.updateCandidate(studid,Candidate(currentStatus: result));

                                                            http.createQuans(Quans(
                                                              id: studid,
                                                              numericalAbility: numerical,
                                                              verbalAbility: verbal,
                                                              codingAndDecoding: coding,
                                                              logicalReasoning: logical,
                                                              result: result,
                                                            ));
                                                          },
                                                          icon: const Icon(Icons.done)))
                                                    ],
                                                  ),
                                                ); },
                                              future: http.getParam('S002'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Card(
                                  color: (index % 2 ==0 ) ? Colors.white : Colors.grey[200],
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("name : ${snapshot.data.assignedCandidates[index].name}"),
                                            Container(
                                              width: 100,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: retColor(),
                                              ),
                                              child: Text(
                                                e?[index].currentStatus,
                                                style: const TextStyle(fontSize: 14,color: Colors.black),textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Container(width: 210,child: Text("email : ${snapshot.data.assignedCandidates[index].email}",)),
                                            SizedBox(width: 50,),
                                            Text("Phone : ${snapshot.data.assignedCandidates[index].mobileNumber}"),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text("Qualification : ${snapshot.data.assignedCandidates[index].highestQualification}"),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text("Interview Schedule : ${snapshot.data.assignedCandidates[index].availableDateAndTime}"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                );
              }
              else if(snapshot.hasError){
                return const Center(child: Icon(Icons.error),);
              }else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        )
    );
  }
}
