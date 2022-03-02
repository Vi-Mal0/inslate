import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Model/Candidate.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  String id;
  HomeScreen(this.id, {Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HttpService http = HttpService();
  final now = DateTime.now();
  bool todaytask = true;

  List<Candidate> todays = [];
  List<Candidate> upcoming = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: http.getEmployeeByID(widget.id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData){
          todays.clear();
          upcoming.clear();
          for (var e in snapshot.data.assignedCandidates) {

            if (e.availableDateAndTime.toString().split(" ")[0] ==
                DateFormat("dd-MM-yyyy").format(now) && e.currentStatus == "Assigned") {
              todays.add(e);
            }
            if(e.currentStatus != "Passed" && e.availableDateAndTime.toString().split(" ")[0] !=
                DateFormat("dd-MM-yyyy").format(now) && e.currentStatus != "Failed"){
              upcoming.add(e);
            }
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Card(
                    color: Colors.purple[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 10,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.purpleAccent,
                                radius: 30,
                              ),
                            ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                            snapshot.data.employeeName.toString(),
                                              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                                            ),
                                      Text(
                                        DateFormat.yMMMMd('en_US').format(now),
                                      ),
                                    ],
                                  ),
                              ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20,0,20,0),
                          child: Divider(color: Colors.black45,),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25,10,25,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height:50,
                                    width: 50,
                                    child: Neumorphic(
                                      curve: Curve(Neumorphic.MAX_DEPTH),
                                      child: Center(child: Text("876")),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text("sample#")
                                ],
                              ),
                              Column(
                                children:  [
                                  Container(
                                    height:50,
                                    width: 50,
                                    child: Neumorphic(
                                      child: Center(child: Text("876")),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text("sample#")
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height:50,
                                    width: 50,
                                    child: Neumorphic(
                                      child: Center(child: Text("876")),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text("sample#")
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height:50,
                                    width: 50,
                                    child: Neumorphic(
                                      child: Center(child: Text("876")),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text("sample#")
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Visibility(
                    visible: todaytask,
                    child: const Text(
                      "Today's Interview",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                  Visibility(visible : todaytask,child: SizedBox(height: 8,)),
                todays.isNotEmpty
                    ? SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: todays.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 150,
                        width: 200,
                        child: Card(
                          elevation: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(todays[index].id.toString()),
                              Text(todays[index].name.toString()),
                              Text(todays[index].highestQualification.toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
                    :Visibility(
                      visible: todaytask,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 150,
                            width: 360,
                            child: Card(
                              elevation: 1.5,
                              child: Row(
                                children: const [
                                  Icon(Icons.exposure_zero,size: 100,),
                                  Text("Interview",style: TextStyle(fontSize: 30),),
                                ],
                              ),
                            ),
                          ),
                          IconButton(onPressed: (){
                            setState(() {
                              todaytask = false;
                            });
                          }, icon: const Icon(Icons.close),
                            iconSize: 40,)
                        ],
                      ),
                ),
                const SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Upcoming Interview",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                upcoming.isEmpty
                    ? SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.height,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 150,
                            width: 360,
                            child: Card(
                              elevation: 1.5,
                              child: Row(
                                children: const [
                                  Icon(Icons.exposure_zero,size: 100,),
                                  Text("Interview",style: TextStyle(fontSize: 30),),
                                ],
                              ),
                            ),
                          ),
                          IconButton(onPressed: (){
                            setState(() {
                              todaytask = false;
                            });
                          }, icon: const Icon(Icons.close),
                            iconSize: 40,)
                        ],
                      ),
                    )
                    : Expanded(
                      child: ListView.builder(
                          itemCount: upcoming.length,
                          itemBuilder: (context, index) {
                            retColor(){
                              var clr =upcoming[index].currentStatus;
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
                            return SizedBox(
                              height: 160,
                              width: 100,
                              child: Card(
                                elevation: 3,
                                color: (index %2 ==0 ) ? Colors.white :Colors.grey[200],
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("name : ${upcoming[index].name}"),
                                          Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: retColor(),
                                            ),
                                            child: Text(
                                              upcoming[index].currentStatus,
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
                                          SizedBox(width: 210,child: Text("email : ${upcoming[index].email}",)),
                                          const SizedBox(width: 50,),
                                          Text("Phone : ${upcoming[index].mobileNumber}"),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text("Qualification : ${upcoming[index].highestQualification}"),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text("Interview Schedule : ${upcoming[index].availableDateAndTime}"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                    ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Icon(Icons.error),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
