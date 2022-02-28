import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                                "Hey ${snapshot.data.employeeName}",
                                    style : const TextStyle(fontWeight: FontWeight.bold,
                                        fontSize: 30)
                                ),
                          Text(
                            DateFormat.yMMMMd('en_US').format(now),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                      // const CircleAvatar(
                      //   radius: 40,
                      //   child: Icon(Icons.account_circle),
                      // ),
                    ],
                  ),
                ),
                Visibility(
                  visible: todaytask,
                  child: const Text(
                    "Today's Interview",
                    style: TextStyle(fontSize: 24),
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
                            width: 400,
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
                            iconSize: 45,)
                        ],
                      ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  "Upcoming Interview",
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 8,),
                upcoming.isEmpty
                    ? Expanded(
                      child: Card(
                          elevation: 3,
                          color: Colors.grey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.exposure_zero),
                              Text("Interview"),
                            ],
                          ),
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
