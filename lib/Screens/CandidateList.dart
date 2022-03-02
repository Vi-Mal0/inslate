import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Screens/CandidateProfile.dart';
import 'package:page_transition/page_transition.dart';

import '../Model/Candidate.dart';

class CandidateList extends StatefulWidget {
  String ref;
  CandidateList(this.ref,{Key? key}) : super(key: key);

  @override
  _CandidateListState createState() => _CandidateListState();
}

class _CandidateListState extends State<CandidateList> {

  void refreshData() {
  }

  onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  void navigateSecondPage(id) {
    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: CandidateProfile(id))).then(onGoBack);
  }

  HttpService http=HttpService();
  List<Candidate> all = [];
  List<Candidate> AssignedList = [];
  List<Candidate> PassedList = [];
  List<Candidate> FailedList = [];
  List<Candidate> CapturedList = [];
  TextEditingController controller = TextEditingController();
  bool isSearch = false;
  List<Candidate> _SearchResult = [];

  Widget _buildSearchBox() {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width-112,
          child:  TextField(
            controller: controller,
            decoration:  const InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
            ),
            onChanged:onSearchTextChanged,
          ),
        ),
      ],
    );
  }
  onSearchTextChanged(String text) async {
    if(text.isNotEmpty){
      _SearchResult.clear();
      http.searchCandidate(text).then((value){
        for(var e in value){
          _SearchResult.add(e);
        }
      });
      setState(() {
        isSearch = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SizedBox(height: 60,
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  },icon: const Icon(Icons.arrow_back,size: 35,),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildSearchBox(),
                  ),
                  PopupMenuButton(
                    color: Colors.white,
                    itemBuilder: (context) => [
                      const PopupMenuItem<int>(
                        value: 0,
                        child: SizedBox(width: 100 ,child: Text("Setting ",style: TextStyle(color: Colors.black),)),
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: Container(width: 100 ,child: Text("About ",style: TextStyle(color: Colors.black),)),
                      ),
                      PopupMenuItem<int>(
                        value: 2,
                        child: Container(width: 100 ,child: Text("Exit ",style: TextStyle(color: Colors.black),)),
                      ),
                    ],
                    onSelected: (item) => {print(item)},
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: (){
                        setState(() {
                          widget.ref ="Total";
                        });
                      }, child: const Text("All",
                        style: TextStyle(fontSize: 14,color: Colors.black),textAlign: TextAlign.center,
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: (){
                          setState(() {
                            widget.ref ="Passed";
                          });
                        }, child: const Text("Passed",
                        style: TextStyle(fontSize: 14,color: Colors.black),textAlign: TextAlign.center,
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: (){
                          setState(() {
                            widget.ref ="Captured";
                          });
                        }, child: const Text("Captured",
                        style: TextStyle(fontSize: 14,color: Colors.black),textAlign: TextAlign.center,
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: (){
                          setState(() {
                            widget.ref ="Failed";
                          });
                        }, child: const Text("Failed",
                        style: TextStyle(fontSize: 14,color: Colors.black),textAlign: TextAlign.center,
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: (){
                          setState(() {
                            widget.ref ="Assigned";
                          });
                        }, child: const Text("Assigned",
                        style: TextStyle(fontSize: 14,color: Colors.black),textAlign: TextAlign.center,
                      ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              // height: MediaQuery.of(context).size.height/1.1038,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FutureBuilder(
                  future: http.getCandidate(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData){
                      all.clear();
                      AssignedList.clear();
                      PassedList.clear();
                      FailedList.clear();
                      CapturedList.clear();

                      for(var e in snapshot.data){
                        all.add(e);
                        if(e.currentStatus == "Assigned"){
                          AssignedList.add(e);
                        }
                        if(e.currentStatus == "Passed"){
                          PassedList.add(e);
                        }
                        if(e.currentStatus == "Captured"){
                          CapturedList.add(e);
                        }
                        if(e.currentStatus == "Failed"){
                          FailedList.add(e);
                        }
                      }

                      displaylist(){
                        if(widget.ref == "Captured"){ return CapturedList;}
                        else if(widget.ref == "Assigned"){return AssignedList;}
                        else if(widget.ref == "Passed"){return PassedList;}
                        else if(widget.ref == "Failed"){return FailedList;}
                        return snapshot.data;
                      }
                      List<Candidate>? e =displaylist();
                      if(isSearch){ e?.clear(); e = _SearchResult;}
                      return ListView.builder(
                        itemCount:e?.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: InkWell(
                              onTap: (){
                                navigateSecondPage(e?[index].id);
                              },
                              child: Container(
                                height: 100,
                                color: (index %2 ==0 ) ? Colors.white :Colors.grey[200],
                                child: Stack(
                                  children: [
                                  Positioned(
                                    child: ProfilePicture(
                                    name: e?[index].name,
                                    radius: 31,
                                    fontsize: 21,
                                    // random: true,
                                    ),
                                    top: 20,
                                  ),
                                    Positioned(
                                      left: 90,
                                      top: 25,
                                      child: Text(
                                        "${e?[index].name}",
                                        style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
                                    ),
                                    Positioned(
                                      left: 90,
                                      top: 60,
                                      child: Text(
                                          "  ${e?[index].email}",
                                        style: const TextStyle(fontSize: 16) ,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    if(e?[index].currentStatus=="Assigned")...[
                                      Positioned(
                                        right: MediaQuery.of(context).size.width*.03,
                                        top: 10,
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.cyan,
                                          ),
                                          child: Text(
                                              e?[index].currentStatus,
                                              style: const TextStyle(fontSize: 14,color: Colors.black),textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ]
                                    else if(e?[index].currentStatus=="Captured")...[
                                      Positioned(
                                        right: MediaQuery.of(context).size.width*.03,
                                        top: 10,
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.yellow,
                                          ),
                                          child: Text(
                                            e?[index].currentStatus,
                                              style: const TextStyle(fontSize: 14,color: Colors.black),textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ]
                                    else if(e?[index].currentStatus=="Passed")...[
                                        Positioned(
                                          right: MediaQuery.of(context).size.width*.03,
                                          top: 10,
                                          child: Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.green,
                                            ),
                                            child: Text(
                                              e?[index].currentStatus,
                                                style: const TextStyle(fontSize: 14,color: Colors.black),textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      ]
                                      else if(e?[index].currentStatus=="Failed")...[
                                          Positioned(
                                            right: MediaQuery.of(context).size.width*.03,
                                            top: 10,
                                            child: Container(
                                              width: 100,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.red,
                                              ),
                                              child: Text(
                                                e?[index].currentStatus,
                                                  style: const TextStyle(fontSize: 14,color: Colors.black),textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )
                                        ]
                                  ],
                                ),
                                  ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Center(child: Icon(Icons.error),);
                    } else {
                      return const Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
