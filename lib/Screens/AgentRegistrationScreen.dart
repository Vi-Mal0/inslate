import 'dart:convert';

import 'package:animated_textformfields/animated_textformfield/animated_textformfield.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Model/ClientData.dart';
import 'package:insuranceprototype/Screens/ClientRegistrationScreen.dart';
import 'package:page_transition/page_transition.dart';

class AgentRegistrationScreen extends StatefulWidget {
  const AgentRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<AgentRegistrationScreen> createState() =>
      _AgentRegistrationScreenState();
}

class _AgentRegistrationScreenState extends State<AgentRegistrationScreen> {
  HttpService api =HttpService();
  var clientID;
  TextEditingController exclusive = TextEditingController();
  TextEditingController previous = TextEditingController();
  TextEditingController distribution = TextEditingController();
  TextEditingController branch = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController agentType = TextEditingController();
  TextEditingController reportingTo = TextEditingController();
  TextEditingController payMethod = TextEditingController();
  TextEditingController payFrequency = TextEditingController();
  TextEditingController currency = TextEditingController();
  TextEditingController min = TextEditingController();
  TextEditingController bonus = TextEditingController();
  TextEditingController basic = TextEditingController();
  TextEditingController renewal = TextEditingController();
  TextEditingController servicing = TextEditingController();
  TextEditingController commission = TextEditingController();
  TextEditingController candidate = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  FocusNode myFocusNode1 = FocusNode();
  FocusNode myFocusNode2 = FocusNode();
  FocusNode myFocusNode3 = FocusNode();
  FocusNode myFocusNode4 = FocusNode();
  FocusNode myFocusNode5 = FocusNode();
  FocusNode myFocusNode6 = FocusNode();
  FocusNode myFocusNode7 = FocusNode();
  FocusNode myFocusNode8 = FocusNode();
  FocusNode myFocusNode9 = FocusNode();
  FocusNode myFocusNode10 = FocusNode();
  FocusNode myFocusNode11 = FocusNode();
  FocusNode myFocusNode12 = FocusNode();
  FocusNode myFocusNode13 = FocusNode();
  FocusNode myFocusNode14 = FocusNode();
  FocusNode myFocusNode15 = FocusNode();
  FocusNode myFocusNode16 = FocusNode();
  FocusNode myFocusNode17 = FocusNode();
  FocusNode myFocusNode18 = FocusNode();
  FocusNode myFocusNode19 = FocusNode();
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  TextEditingController date = TextEditingController();
  TextEditingController date2 = TextEditingController();

  Future<void> _refreshData() async {
    setState(() {});
  }

  final _formKey = GlobalKey<FormState>();

  String? selectedClient;

  bool previousAgent =false;

  @override
  Widget build(BuildContext context) {

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                    color: Colors.white,
                    height: 50,
                    child: ListTile(
                      leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      title: const Text(
                        "Agent Registration",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          if(_formKey.currentState!.validate()){
                            Navigator.pop(context);

                            var headers = {'Content-Type': 'application/json'};
                            var request = http.Request('POST',
                                Uri.parse('http://192.168.0.104:8080/agent/add'));
                            request.body = json.encode({
                              "dateAppointed": date.text,
                              "exclusive": exclusive.text,
                              "previousAgent": previousAgent,
                              "prevDateOfTermination": date2.text,
                              "distributionChannel": distribution.text,
                              "branch": branch.text,
                              "areaCode": area.text,
                              "clientId":clientID,
                              "agentType": agentType.text,
                              "reportingTo": reportingTo.text,
                              "payMethod": payMethod.text,
                              "payFrequency": payFrequency.text,
                              "currencyType": currency.text,
                              "minimumAmount": min.text,
                              "bonusAllocation": bonus.text,
                              "basicCommission": basic.text,
                              "renewalCommission": renewal.text,
                              "servicingCommission": servicing.text,
                              "commissionClass": commission.text
                            });
                            request.headers.addAll(headers);

                            http.StreamedResponse response = await request.send();

                            if (response.statusCode == 200) {
                              if (kDebugMode) {
                                print("Success");
                              }
                            } else {
                              if (kDebugMode) {
                                print(response.reasonPhrase);
                              }
                            }
                          }
                        },
                        icon: const Icon(Icons.done),
                      ),
                    )),
                Expanded(
                    child: ListView(
                  children: [
                    FutureBuilder(
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          List<ClientData> clientList = snapshot.data;
                          List<String> clName = [];
                          List<int> indx = [];
                          for(var e in clientList){
                            clName.add(e.givenName.toString()+ " " +e.surName.toString());
                            indx.add(int.parse(e.id.toString()));
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 300,
                                height: 70,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                    value: selectedClient,
                                    isExpanded: true,
                                    hint: const Text(
                                      'Client',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    items: clName
                                        .map(( value) =>
                                        DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                        .toList(),
                                    onChanged: (value) {
                                      int idx = clName.indexOf(value.toString());
                                      setState(() {
                                        selectedClient = value.toString();
                                        clientID = indx[idx];
                                      });
                                      if (kDebugMode) {
                                        print(clientID.toString());
                                      }
                                      _refreshData();
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffbe61565),
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                child:
                                                const ClientRegistrationScreen())).then((_) => _refreshData());
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      )))
                            ],
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      future: api.getClient(),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: DateTimePicker(
                        type: DateTimePickerType.date,
                        dateMask: 'dd-MM-yyyy',
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        icon: const Icon(Icons.event),
                        dateLabelText: 'Appointed Date',
                        timeLabelText: "Hour",
                        onChanged: (val) {
                          setState(() {
                            date.text = DateFormat("MM-dd-yyyy")
                                .format(DateTime.parse(val));
                          });
                        },
                        onSaved: (val) {
                          setState(() {
                            date.text = DateFormat("MM-dd-yyyy")
                                .format(DateTime.parse(val!));
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                      child: Row(
                        children: [
                          AnimatedTextFormField(
                            width: 180,
                            height: 48.0,
                            inputType: TextInputType.text,
                            hintText: "Exclusive",
                            controller: exclusive,
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            focusNode: myFocusNode,
                            cornerRadius: BorderRadius.circular(14.0),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(
                                    getColor),
                                value: previousAgent,
                                onChanged: (bool? value) {
                                  setState(() {
                                    previousAgent = value!;
                                  });
                                },
                              ),
                              const Text("Previous Agent")
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: DateTimePicker(
                        type: DateTimePickerType.date,
                        dateMask: 'dd-MM-yyyy',
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        icon: const Icon(Icons.event),
                        dateLabelText: 'Date of termination',
                        timeLabelText: "Hour",
                        onChanged: (val) {
                          setState(() {
                            date2.text = DateFormat("MM-dd-yyyy")
                                .format(DateTime.parse(val));
                          });
                        },
                        onSaved: (val) {
                          setState(() {
                            date2.text = DateFormat("MM-dd-yyyy")
                                .format(DateTime.parse(val!));
                          });
                        },
                      ),
                    ),
                    AnimatedTextFormField(
                      width: MediaQuery.of(context).size.width * 0.875,
                      height: 48.0,
                      inputType: TextInputType.text,
                      hintText: "Distribution Channel",
                      controller: distribution,
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      focusNode: myFocusNode2,
                      cornerRadius: BorderRadius.circular(14.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                      child: Row(
                        children: [
                          AnimatedTextFormField(
                            width: 180,
                            height: 48.0,
                            inputType: TextInputType.text,
                            hintText: "Branch",
                            controller: branch,
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            focusNode: myFocusNode3,
                            cornerRadius: BorderRadius.circular(14.0),
                          ),
                          AnimatedTextFormField(
                            width: 180,
                            height: 48.0,
                            inputType: TextInputType.text,
                            hintText: "Area Code",
                            controller: area,
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            focusNode: myFocusNode4,
                            cornerRadius: BorderRadius.circular(14.0),
                          ),
                        ],
                      ),
                    ),
                    AnimatedTextFormField(
                      width: MediaQuery.of(context).size.width * 0.875,
                      height: 48.0,
                      inputType: TextInputType.text,
                      hintText: "Agent Type",
                      controller: agentType,
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      focusNode: myFocusNode5,
                      cornerRadius: BorderRadius.circular(14.0),
                    ),
                    AnimatedTextFormField(
                      width: MediaQuery.of(context).size.width * 0.875,
                      height: 48.0,
                      inputType: TextInputType.text,
                      hintText: "Reporting To",
                      controller: reportingTo,
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      focusNode: myFocusNode6,
                      cornerRadius: BorderRadius.circular(14.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                      child: Row(
                        children: [
                          AnimatedTextFormField(
                            width: 180,
                            height: 48.0,
                            inputType: TextInputType.text,
                            hintText: "Pay Method",
                            controller: payMethod,
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            focusNode: myFocusNode7,
                            cornerRadius: BorderRadius.circular(14.0),
                          ),
                          AnimatedTextFormField(
                            width: 180,
                            height: 48.0,
                            inputType: TextInputType.text,
                            hintText: "Pay Frequency",
                            controller: payFrequency,
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            focusNode: myFocusNode8,
                            cornerRadius: BorderRadius.circular(14.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                      child: Row(
                        children: [
                          AnimatedTextFormField(
                            width: 180,
                            height: 48.0,
                            inputType: TextInputType.text,
                            hintText: "Currency Type",
                            controller: currency,
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            focusNode: myFocusNode9,
                            cornerRadius: BorderRadius.circular(14.0),
                          ),
                          AnimatedTextFormField(
                            width: 180,
                            height: 48.0,
                            inputType: TextInputType.text,
                            hintText: "Min Amount",
                            controller: min,
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            focusNode: myFocusNode10,
                            cornerRadius: BorderRadius.circular(14.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                      child: Row(
                        children: [
                          AnimatedTextFormField(
                            width: 180,
                            height: 48.0,
                            inputType: TextInputType.text,
                            hintText: "Bonus Allocation",
                            controller: bonus,
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            focusNode: myFocusNode11,
                            cornerRadius: BorderRadius.circular(14.0),
                          ),
                          AnimatedTextFormField(
                            width: 180,
                            height: 48.0,
                            inputType: TextInputType.text,
                            hintText: "Basic Commission",
                            controller: basic,
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            focusNode: myFocusNode12,
                            cornerRadius: BorderRadius.circular(14.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                      child: Row(
                        children: [
                          AnimatedTextFormField(
                            width: 180,
                            height: 48.0,
                            inputType: TextInputType.text,
                            hintText: "Renewal Comission",
                            controller: renewal,
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            focusNode: myFocusNode13,
                            cornerRadius: BorderRadius.circular(14.0),
                          ),
                          AnimatedTextFormField(
                            width: 180,
                            height: 48.0,
                            inputType: TextInputType.text,
                            hintText: "Servicing Commission",
                            controller: servicing,
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            focusNode: myFocusNode14,
                            cornerRadius: BorderRadius.circular(14.0),
                          ),
                        ],
                      ),
                    ),
                    AnimatedTextFormField(
                      width: MediaQuery.of(context).size.width * 0.875,
                      height: 48.0,
                      inputType: TextInputType.text,
                      hintText: "Commission Class",
                      controller: commission,
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      focusNode: myFocusNode15,
                      cornerRadius: BorderRadius.circular(14.0),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
