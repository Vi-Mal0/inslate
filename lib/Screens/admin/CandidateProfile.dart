import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Model/Employee.dart';

import '../../Model/Candidate.dart';

class CandidateProfile extends StatefulWidget {

  int id;
  CandidateProfile(this.id, {Key? key}) : super(key: key);

  @override
  _CandidateProfileState createState() => _CandidateProfileState();
}

class _CandidateProfileState extends State<CandidateProfile> {
  HttpService http = HttpService();
  TextEditingController empctl =TextEditingController();
  var empselected;
  List<Employee> emplist = [];

  // Candidate candidate = Candidate();
  @override
  Widget build(BuildContext context) {
    // http.getCandidateByID(widget.id.toString()).then((value){
    //   setState(() {
    //     candidate =value;
    //   });
    // });
    http.getEmployee().then((value) {
        emplist = value;
    });

    _showMyDialog()  {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Assign Employee'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Select Your proof',
                      style: TextStyle(fontSize: 14),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 30,
                    buttonHeight: 60,
                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    items: emplist
                        .map((item) =>
                        DropdownMenuItem<String>(
                          value: item.id.toString(),
                          child: Text(
                            item.employeeName,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        empselected = value.toString();
                      });
                    },
                    onSaved: (value){
                      setState(() {
                        empselected = value;
                      });
                    },
                  ),
                  // TextFormField(
                  //   controller: empctl,
                  //   decoration: const InputDecoration(
                  //     icon: Icon(Icons.person),
                  //     labelText: 'enter emp id',
                  //   ),
                  // ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                  http.updateCandidate(widget.id.toString(),Candidate(employee:empselected));
                },
              ),
            ],
          );
        },
      );
    }

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: FutureBuilder(
            future: http.getCandidateByID(widget.id.toString()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        },icon: Icon(Icons.arrow_back),),
                        IconButton(onPressed: (){
                          _showMyDialog();
                        },icon: Icon(Icons.add),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text(snapshot.data.name),
                    Text(snapshot.data.mobileNumber),
                    Text(snapshot.data.email),
                    Text(snapshot.data.dateOfBirth),
                    Text(snapshot.data.highestQualification),
                    Text(snapshot.data.proof),
                    Text(snapshot.data.proofId),
                    Text(snapshot.data.communication),
                    Text(snapshot.data.availableDateAndTime),
                    Text(snapshot.data.currentStatus),
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
