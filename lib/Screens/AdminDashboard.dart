import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Model/Candidate.dart';
import 'package:insuranceprototype/Screens/CandidateList.dart';

import 'CandidateProfile.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  HttpService http= HttpService();

  List<Candidate> AssignedList = [];
  List<Candidate> PassedList = [];
  List<Candidate> FailedList = [];

  void refreshData() {
  }

  onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  void navigateAdminPage(String s) {
    Route route = MaterialPageRoute(builder: (context) => CandidateList(s));
    Navigator.push(context, route).then(onGoBack);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 400,
      child: FutureBuilder(
        future: http.getCandidate(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            AssignedList.clear();
            PassedList.clear();
            FailedList.clear();
            for(var e in snapshot.data){
              if(e.currentStatus == "ASSIGNED"){
                AssignedList.add(e);
              }
              if(e.currentStatus == "PASSED"){
                PassedList.add(e);
              }
              if(e.currentStatus == "FAILED"){
                FailedList.add(e);
              }
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Wrap(
                        spacing:20,
                        runSpacing: 20.0,
                        children: <Widget>[
                          InkWell(
                            onTap: (){
                              navigateAdminPage("Total");
                            },
                            child: SizedBox(
                              width:200.0,
                              height: 200.0,
                              child: Card(
                                color: Colors.deepPurple[400],
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)
                                ),
                                child:Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          const Text(
                                            "Total Application",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 40.0,
                                          ),
                                          Text(snapshot.data.length.toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }
          else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }

}
