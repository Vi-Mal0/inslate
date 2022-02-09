import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../HTTP/HttpService.dart';
import '../Model/Employee.dart';

class EmployeeProfile extends StatefulWidget {
  int id;
  EmployeeProfile(this.id,{Key? key}) : super(key: key);

  @override
  _EmployeeProfileState createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> {
  HttpService http = HttpService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: FutureBuilder(
            future: http.getEmployeeByID(widget.id.toString()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                return Column(
                  children: [
                    Container(
                      height: 70,
                      child: Row(
                        children: [
                          IconButton(onPressed: (){
                            Navigator.pop(context);
                          },icon: Icon(Icons.arrow_back),),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(snapshot.data.employeeId),
                    Text(snapshot.data.employeeName),
                    Text(snapshot.data.employeeDesignation),
                      SizedBox(height: 20,),
                      Container(
                        height: 600,
                        child: ListView.builder(
                        itemCount: snapshot.data.assignedCandidates.length,
                        padding: const EdgeInsets.only(top: 10.0),
                        itemBuilder: (context, index) {
                        return Center(
                          child: Card(
                            child: Text(snapshot.data.assignedCandidates[index].name),
                          ),
                        );
                        }),
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
