import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';

class EventLogList extends StatefulWidget {
  int id;
  EventLogList({Key? key, required this.id}) : super(key: key);

  @override
  State<EventLogList> createState() => _EventLogListState();
}

class _EventLogListState extends State<EventLogList> {
  HttpService api = HttpService();

  Future<void> _refreshData() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: Column(
            children: [
              Container(
                  color: Colors.white,
                  height: 50,
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    title: const Text(
                      "Event Logs",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )),
              Expanded(
                child: FutureBuilder(
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          getColor() {
                            String pri = snapshot
                                .data[index].notificationPriority
                                .toString();
                            if (pri.toLowerCase() == "high") {
                              return Colors.orange;
                            }
                            if (pri.toLowerCase() == "low") {
                              return Colors.green;
                            }
                            if (pri.toLowerCase() == "medium") {
                              return Colors.blue;
                            }
                            if (pri.toLowerCase() == "alert") {
                              return Colors.red;
                            }
                          }

                          return Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                            child: Card(
                              color: getColor(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "${snapshot.data[index].notificationType}   ${snapshot.data[index].notificationPriority}",
                                      style: const TextStyle(
                                          color: Colors.brown,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      "${snapshot.data[index].candidateId}",
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      " ${snapshot.data[index].notificationText}",
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                  future: api.getEventLogByEmployeeId(widget.id),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
