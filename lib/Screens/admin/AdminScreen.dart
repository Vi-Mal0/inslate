import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Screens/admin/CandidateProfile.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  void refreshData() {
  }

  onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  void navigateSecondPage(id) {
    Route route = MaterialPageRoute(builder: (context) => CandidateProfile(id));
    Navigator.push(context, route).then(onGoBack);
  }

  HttpService http=HttpService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  },icon: const Icon(Icons.arrow_back),),
                  PopupMenuButton(
                    // icon: const Icon(Icons.more_vert),  //don't specify icon if you want 3 dot menu
                    color: Colors.white,
                    itemBuilder: (context) => [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Container(width: 100 ,child: Text("Setting ",style: TextStyle(color: Colors.black),)),
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
              height: MediaQuery.of(context).size.height-115,
              child: FutureBuilder(
                future: http.getCandidate(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 100,
                            child: InkWell(
                              onTap: (){
                                navigateSecondPage(snapshot.data[index].id);
                              },
                              child: Container(
                                // color: (index % 2 == 0) ? Colors.cyan[50] : Colors.white,
                                child: Stack(
                                  children: [
                                  Positioned(
                                    child: ProfilePicture(
                                    name: snapshot.data[index].name,
                                    radius: 31,
                                    fontsize: 21,
                                    // random: true,
                                ),
                                    top: 20,
                                  ),
                                    Positioned(
                                      left: 90,
                                      top: 25,
                                      child: Text(snapshot.data[index].name,
                                        style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
                                    ),
                                    Positioned(
                                      left: 90,
                                      top: 60,
                                      child: Text("${snapshot.data[index].highestQualification},"
                                          "  ${snapshot.data[index].email}",
                                        style: const TextStyle(fontSize: 16) ,),
                                    ),
                                    if(snapshot.data[index].currentStatus=="ASSIGNED")...[
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
                                              snapshot.data[index].currentStatus,
                                              style: const TextStyle(fontSize: 14,color: Colors.black),textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ]
                                    else if(snapshot.data[index].currentStatus=="CAPTURED")...[
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
                                            snapshot.data[index].currentStatus,
                                              style: const TextStyle(fontSize: 14,color: Colors.black),textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ]
                                    else if(snapshot.data[index].currentStatus=="PASSED")...[
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
                                              snapshot.data[index].currentStatus,
                                                style: const TextStyle(fontSize: 14,color: Colors.black),textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      ]
                                      else if(snapshot.data[index].currentStatus=="FAILED")...[
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
                                                snapshot.data[index].currentStatus,
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
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(child: Icon(Icons.error),);
                  } else {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
