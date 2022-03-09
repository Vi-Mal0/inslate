import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Model/Candidate.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  String id;
  Dashboard(this.id, {Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  HttpService http = HttpService();
  final now = DateTime.now();
  bool todaytask = true;
  bool isUpcoming = true;

  List<Candidate> todays = [];
  List<Candidate> upcoming = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (Theme.of(context).brightness == Brightness.dark) ? Colors.black : Colors.white,
      child: FutureBuilder(
        future: http.getEmployeeByID(widget.id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            todays.clear();
            upcoming.clear();
            for (var e in snapshot.data.assignedCandidates) {
              if (e.availableDateAndTime.toString().split(" ")[0] ==
                      DateFormat("dd-MM-yyyy").format(now) &&
                  e.currentStatus == "Assigned") {
                todays.add(e);
              }
              if (e.currentStatus != "Passed" &&
                  e.availableDateAndTime.toString().split(" ")[0] !=
                      DateFormat("dd-MM-yyyy").format(now) &&
                  e.currentStatus != "Failed") {
                upcoming.add(e);
              }
            }
            return Column(
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
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ProfilePicture(
                                name: snapshot.data.employeeName,
                                radius: 31,
                                fontsize: 35,
                                random: true,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data.employeeName.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 130,
                                      ),
                                      Text(
                                        "Date : ${DateFormat.yMMMMd('en_US').format(now)}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    snapshot.data.employeeDesignation,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Divider(
                            color: Colors.black45,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Neumorphic(
                                      style: NeumorphicStyle(
                                          border: const NeumorphicBorder(
                                            isEnabled: true,
                                            color: Color(0x33000000),
                                            width: 0.8,
                                          ),
                                          shape: NeumorphicShape.flat,
                                          lightSource: LightSource.top,
                                          color:(Theme.of(context).brightness == Brightness.dark) ? Colors.black : Colors.white,
          ),
                                      child: Center(
                                          child: Text(
                                        snapshot.data.assignedCandidates.length
                                            .toString(),
                                        style: TextStyle(
                                            color: (Theme.of(context).brightness == Brightness.dark) ? Colors.white : Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "BUCKET",
                                    style: TextStyle(
                                      color: (Theme.of(context).brightness == Brightness.dark) ? Colors.black : Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Neumorphic(
                                      style: NeumorphicStyle(
                                          border: const NeumorphicBorder(
                                            isEnabled: true,
                                            color: Color(0x33000000),
                                            width: 0.8,
                                          ),
                                          shape: NeumorphicShape.flat,
                                          lightSource: LightSource.top,
                                          color: (Theme.of(context).brightness == Brightness.dark) ? Colors.black : Colors.white),
                                      child: Center(
                                          child: Text(
                                        "10",
                                        style: TextStyle(
                                            color: (Theme.of(context).brightness == Brightness.dark) ? Colors.white : Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "PASSED",
                                    style:  TextStyle(
                                        color: (Theme.of(context).brightness == Brightness.dark) ? Colors.black : Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: Neumorphic(
                                      style:  NeumorphicStyle(
                                          border: const NeumorphicBorder(
                                            isEnabled: true,
                                            color: Color(0x33000000),
                                            width: 0.8,
                                          ),
                                          shape: NeumorphicShape.flat,
                                          lightSource: LightSource.top,
                                          color:(Theme.of(context).brightness == Brightness.dark) ? Colors.black : Colors.white),
                                      child: Center(
                                          child: Text(
                                        "3",
                                        style: TextStyle(
                                            color: (Theme.of(context).brightness == Brightness.dark) ? Colors.white : Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "FAILED",
                                    style: TextStyle(
                                        color: (Theme.of(context).brightness == Brightness.dark) ? Colors.black : Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: Neumorphic(
                                      style:  NeumorphicStyle(
                                          border: const NeumorphicBorder(
                                            isEnabled: true,
                                            color: Color(0x33000000),
                                            width: 0.8,
                                          ),
                                          shape: NeumorphicShape.flat,
                                          lightSource: LightSource.top,
                                          color: (Theme.of(context).brightness == Brightness.dark) ? Colors.black : Colors.white),
                                      child: Center(
                                          child: Text(
                                        "0",
                                        style: TextStyle(
                                            color: (Theme.of(context).brightness == Brightness.dark) ? Colors.white : Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                   Text(
                                    "HOLD",
                                    style: TextStyle(
                                        color: (Theme.of(context).brightness == Brightness.dark) ? Colors.black : Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Today's Interview",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Visibility(
                    visible: todaytask,
                    child: SizedBox(
                      height: 8,
                    )),
                if (todays.isNotEmpty)
                  SizedBox(
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
                                Text(todays[index]
                                    .highestQualification
                                    .toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Upcoming Interview",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                if (upcoming.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      itemCount: upcoming.length,
                      itemBuilder: (context, index) {
                        retColor() {
                          var clr = upcoming[index].currentStatus;
                          if (clr == "Assigned") {
                            return Colors.cyan;
                          }
                          if (clr == "Captured") {
                            return Colors.yellow;
                          }
                          if (clr == "Passed") {
                            return Colors.green;
                          }
                          if (clr == "Failed") {
                            return Colors.red;
                          }
                        }

                        return SizedBox(
                          height: 160,
                          width: 100,
                          child: Card(
                            elevation: 3,
                            color: (Theme.of(context).brightness == Brightness.dark) ? Colors.grey[700] : Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("name : ${upcoming[index].name}"),
                                      Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: retColor(),
                                        ),
                                        child: Text(
                                          upcoming[index].currentStatus,
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
                                          child: Text(
                                            "email : ${upcoming[index].email}",
                                          )),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      Text(
                                          "Phone : ${upcoming[index].mobileNumber}"),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                          "Qualification : ${upcoming[index].highestQualification}"),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                          "Interview Schedule : ${upcoming[index].availableDateAndTime}"),
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
      ),
    );
  }
}
