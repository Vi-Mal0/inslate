import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Model/Candidate.dart';
import 'package:insuranceprototype/Screens/TodaysInterview.dart';
import 'package:insuranceprototype/Screens/UpcomingInterview.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: (Theme.of(context).brightness == Brightness.dark)
            ? Colors.black
            : Colors.white,
        child: FutureBuilder(
          future: http.getEmployeeByID(widget.id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Card(
                        color: const Color(0xffbe61565),
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
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child: Text(
                                              snapshot.data.employeeName
                                                  .toString(),
                                              style: const TextStyle(
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 50,
                                          ),
                                          Text(
                                            DateFormat.yMMMMd('en_US')
                                                .format(now),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            color:
                                                (Theme.of(context).brightness ==
                                                        Brightness.dark)
                                                    ? Colors.black
                                                    : Colors.white,
                                          ),
                                          child: Center(
                                              child: Text(
                                            snapshot
                                                .data.assignedCandidates.length
                                                .toString(),
                                            style: TextStyle(
                                                color: (Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark)
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "BUCKET",
                                        style: TextStyle(
                                            color:
                                                (Theme.of(context).brightness ==
                                                        Brightness.dark)
                                                    ? Colors.black
                                                    : Colors.white,
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
                                              color: (Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark)
                                                  ? Colors.black
                                                  : Colors.white),
                                          child: Center(
                                              child: Text(
                                            "0",
                                            style: TextStyle(
                                                color: (Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark)
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "PASSED",
                                        style: TextStyle(
                                            color:
                                                (Theme.of(context).brightness ==
                                                        Brightness.dark)
                                                    ? Colors.black
                                                    : Colors.white,
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
                                              color: (Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark)
                                                  ? Colors.black
                                                  : Colors.white),
                                          child: Center(
                                              child: Text(
                                            "0",
                                            style: TextStyle(
                                                color: (Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark)
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "FAILED",
                                        style: TextStyle(
                                            color:
                                                (Theme.of(context).brightness ==
                                                        Brightness.dark)
                                                    ? Colors.black
                                                    : Colors.white,
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
                                              color: (Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark)
                                                  ? Colors.black
                                                  : Colors.white),
                                          child: Center(
                                              child: Text(
                                            "0",
                                            style: TextStyle(
                                                color: (Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark)
                                                    ? Colors.white
                                                    : Colors.black,
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
                                            color:
                                                (Theme.of(context).brightness ==
                                                        Brightness.dark)
                                                    ? Colors.black
                                                    : Colors.white,
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: const Text(
                        "Today's Interview",
                        style: TextStyle(fontSize: 24),
                      ),
                      trailing: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: Todaysinterview(
                                      id: int.parse(widget.id),
                                    )));
                          },
                          child: const Text("See All")),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FutureBuilder(
                      future: http.gettoday(widget.id),
                      builder: (BuildContext context,
                          AsyncSnapshot todayData) {
                        if (snapshot.hasData) {
                          List<Candidate> tdlist = todayData.data;
                          return ListView.builder(
                            padding: const EdgeInsets.fromLTRB(15,0,15,0),
                            itemCount: tdlist.length, itemBuilder: (BuildContext context, int index) {
                              return Card(
                            color: index % 2 == 0 ? Colors.white : Colors.grey[200],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    const Icon(Icons.badge),
                                    Text(
                                        "  ${todayData.data[index].name}"),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    const Icon(Icons.email_outlined),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      "  ${todayData.data[index].email}",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    const Icon(Icons.phone),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "  ${todayData.data[index].mobileNumber}",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                              },

                          );
                        }
                        else{
                          return Center(child: CircularProgressIndicator(),);
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: const Text(
                          "Upcoming Interview",
                          style: TextStyle(fontSize: 24),
                        ),
                        trailing: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: UpcomingInterview(
                                        id: int.parse(widget.id),
                                      )));
                            },
                            child: const Text("See All")),
                      )),
                  Expanded(
                    flex: 2,
                    child: FutureBuilder(
                      future: http.getupcoming(widget.id),
                      builder: (BuildContext context,
                          AsyncSnapshot upcomingData) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            padding: const EdgeInsets.fromLTRB(15,0,15,0),
                            itemCount: upcomingData.data.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: index % 2 == 0 ? Colors.white : Colors.grey[200],
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        const Icon(Icons.badge),
                                        Text(
                                            "  ${upcomingData.data[index].name}"),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        const Icon(Icons.email_outlined),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          "  ${upcomingData.data[index].email}",
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        const Icon(Icons.phone),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "  ${upcomingData.data[index].mobileNumber}",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ],
              );
            }else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
