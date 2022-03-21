import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Model/Employee.dart';

import '../Model/Candidate.dart';

class CandidateProfile extends StatefulWidget {
  int id;
  CandidateProfile(this.id, {Key? key}) : super(key: key);

  @override
  _CandidateProfileState createState() => _CandidateProfileState();
}

class _CandidateProfileState extends State<CandidateProfile> {
  HttpService http = HttpService();
  TextEditingController empctl = TextEditingController();
  var empselected;
  List<Employee> emplist = [];

  @override
  Widget build(BuildContext context) {
    http.getEmployee().then((value) {
      emplist = value;
    });

    Future<void> _refreshData() async {
      setState(() {});
    }

    _showMyDialog() {
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
                      'Assign the interviewer',
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
                        .map((item) => DropdownMenuItem<String>(
                              value: item.id.toString(),
                              child: Text(
                                item.employeeName!,
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
                    onSaved: (value) {
                      setState(() {
                        empselected = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                  http.updateCandidate(
                      widget.id.toString(), Candidate(employee: empselected));
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: FutureBuilder(
            future: http.getCandidateByID(widget.id.toString()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    ListTile(
                      leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          _showMyDialog();_refreshData();

                        },
                        icon: const Icon(Icons.add),
                      ),
                      title: Center(
                        child: const Text("Candidate Profile"),
                      ),
                    ),
                    Expanded(
                        child: ListView(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.grey[200],
                            child: const Text(";)"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            snapshot.data.name,
                            style:
                                const TextStyle(fontSize: 24, letterSpacing: 2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          Icon(Icons.email_outlined),
                          Text(" : "),
                          Text(snapshot.data.email),
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          Icon(Icons.phone),
                          Text(" : "),
                          Text(snapshot.data.mobileNumber),
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Birthdate : ${snapshot.data.dateOfBirth}"),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Qualification : ${snapshot.data.highestQualification}"),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Proof : ${snapshot.data.proof}"),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Proofnumber : ${snapshot.data.proofId}"),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Preffered mode for communication : ${snapshot.data.communication}"),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Available date and time : ${snapshot.data.availableDateAndTime}"),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Crrentstatus : ${snapshot.data.currentStatus}"),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Crrentstatus : ${snapshot.data.result}"),
                      ],
                    ))
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
        ));
  }
}
