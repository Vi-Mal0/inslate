import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Model/Candidate.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  HttpService http= HttpService();

  List<Candidate> getCandidate(){
    List<Candidate> candidate =[];
    http.getCandidate().then((value){
      for(var e in value){
        setState(() {
          candidate.add(e);
        });
      }
    });
    return candidate;
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: SafeArea(
            child: FutureBuilder(
              future: http.getCandidate(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.hasData){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Admin Panel",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(18.0),
                      //   child: Text(
                      //     "Welcome, ",
                      //     style: TextStyle(
                      //         fontSize: 28.0,
                      //         fontWeight: FontWeight.bold
                      //     ),
                      //     textAlign: TextAlign.start,
                      //   ),
                      // ),
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: Wrap(
                            spacing:20,
                            runSpacing: 20.0,
                            children: <Widget>[
                              SizedBox(
                                width:200.0,
                                height: 200.0,
                                child: Card(

                                  color: Color.fromARGB(255,21, 21, 21),
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)
                                  ),
                                  child:Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "Total Application",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40.0,
                                            ),
                                            Text(snapshot.data.length.toString(),
                                              style: TextStyle(
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
                              SizedBox(
                                width:160.0,
                                height: 160.0,
                                child: Card(

                                  color: Color.fromARGB(255,21, 21, 21),
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)
                                  ),
                                  child:Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "Notes",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              "12 Items",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w100
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:160.0,
                                height: 160.0,
                                child: Card(

                                  color: Color.fromARGB(255,21, 21, 21),
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)
                                  ),
                                  child:Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "Agenda",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              "4 Items",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w100
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:160.0,
                                height: 160.0,
                                child: Card(

                                  color: Color.fromARGB(255,21, 21, 21),
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)
                                  ),
                                  child:Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "Settings",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              "6 Items",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w100
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }
                else{
                  return Center(child: const CircularProgressIndicator(),);
                }
              },
            )
        )
    );
  }

}
