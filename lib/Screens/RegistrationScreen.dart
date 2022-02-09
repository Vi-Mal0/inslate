import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Model/Candidate.dart';
import 'package:intl/intl.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  HttpService http = HttpService();
  final _formKey = GlobalKey<FormState>();

  List<String> proofType = ['AADHAR','PAN','VOTER_ID'];

  List<String> preferredMode = ['EMAIL','MOBILE','WHATSAPP'];

  var avdatectl;var proof;var contactMode;  var modeSelected;var proofSelected;


  TextEditingController namectl =TextEditingController();
  TextEditingController pid =TextEditingController();
  TextEditingController phonectl =TextEditingController();
  TextEditingController qualificaitionctl =TextEditingController();
  TextEditingController emailctl =TextEditingController();
  TextEditingController datectl =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Row(
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back))
            ],
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20,20,0,10),
          child: Text("Personal Details",
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w400),),
        ),
        TextFormField(
          controller: namectl,
        decoration: const InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Name',
        ),
        ),
          DateTimePicker(
            type: DateTimePickerType.date,
            dateMask: 'dd-MM-yyyy',
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            icon: Icon(Icons.event),
            dateLabelText: 'Date',
            timeLabelText: "Hour",
            onChanged: (val){
              setState(() {
                datectl.text = DateFormat("dd-MM-yyyy").format(DateTime.parse(val));
                print(datectl.text);
              });
            },
            onSaved: (val){
              setState(() {
                datectl.text = DateFormat("dd-MM-yyyy").format(DateTime.parse(val!));
                print(datectl.text);
              });
            },
          ),
          TextFormField(
            controller: emailctl,
            decoration: const InputDecoration(
              icon: const Icon(Icons.email),
              labelText: 'Email',
            ),
          ),
          Container(
            child: TextFormField(
              controller: phonectl,
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                labelText: 'Phone',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,40,0,10),
            child: Text("Qualification",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w400),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40,0,0,0),
            child: TextFormField(
              controller: qualificaitionctl,
              decoration: const InputDecoration(
                labelText: 'Highest Qualification',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40,0,0,0),
            child: TextFormField(
              controller: qualificaitionctl,
              decoration: const InputDecoration(
                labelText: 'Stream',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40,0,0,0),
            child: TextFormField(
              controller: qualificaitionctl,
              decoration: const InputDecoration(
                labelText: 'Graduation percentage',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,40,0,10),
            child: Text("Proof",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w400),),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20,0,0,0),
          child: Row(
            children: [
                Container(
                  width: 150,
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:   DropdownButtonFormField2(
                      decoration: InputDecoration(
                        //Add isDense true and zero Padding.
                        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        //Add more decoration as you want here
                        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
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
                      items: proofType
                          .map((item) =>
                          DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          proofSelected = value.toString();
                        });
                      },
                      onSaved: (value){
                        setState(() {
                          proofSelected = value.toString();
                        });
                      },
                    ),
                  ),
                ),
              SizedBox(width: 20,),
              Container(width: 300,
                child: Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: pid,
                    decoration:   InputDecoration(
                      labelText: 'ProofId',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,40,0,10),
            child: Text("Availability",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w400),),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20,0,0,0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:   DropdownButtonFormField2(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                isExpanded: true,
                hint: const Text(
                  'Mode of Contact',
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
                items: preferredMode
                    .map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    modeSelected = value.toString();
                  });
                },
                onSaved: (value) {
                  setState(() {
                    modeSelected = value.toString();
                  });
                },
              ),
            ),
          ),
        ),
          DateTimePicker(
              type: DateTimePickerType.dateTime,
              dateMask: 'dd-MM-yyyy HH:MM',
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              icon: Icon(Icons.event),
              dateLabelText: 'Date',
              timeLabelText: "Hour",
              onChanged: (val){
                setState(() {
                  avdatectl = DateFormat("dd-MM-yyyy HH:MM").format(DateTime.parse(val));
                });
              },
              onSaved: (val){
                setState(() {
                  avdatectl = DateFormat("dd-MM-yyyy HH:MM").format(DateTime.parse(val!));
                });
                print(avdatectl);
              },
            ),
        ],
        ),
      ),
    ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pop(context);
      http.createCandidate(
          Candidate(
              name: namectl.text,
              proofId:pid.text,
              mobileNumber: phonectl.text,
              proof: proofSelected,
              dateOfBirth: datectl.text,
              highestQualification: qualificaitionctl.text,
              email: emailctl.text,
              communication: modeSelected,
              availableDateAndTime:avdatectl
          )
      ); },child: const Icon(Icons.done),backgroundColor: Colors.teal,),
  );
  }
}
