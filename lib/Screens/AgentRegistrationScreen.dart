import 'dart:convert';

import 'package:animated_textformfields/animated_textformfield/animated_textformfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      initialDate: selectedDate,
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
        date.text = selectedDate.toString().substring(0, 10);
      });
  }

  _selectDate2(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      initialDate: selectedDate,
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate2 = selected;
        date2.text = selectedDate2.toString().substring(0, 10);
      });
  }

  Future<void> _refreshData() async {
    setState(() {});
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                            String a;
                            String b;
                            String c;
                            a = (date.text.substring(0, 4));
                            b = (date.text.substring(5, 7));
                            c = (date.text.substring(8, 10));
                            String a1;
                            String b1;
                            String c1;
                            a1 = (date2.text.substring(0, 4));
                            b1 = (date2.text.substring(5, 7));
                            c1 = (date2.text.substring(8, 10));

                            String fina = "$b" + "-" + "$c" + "-" + "$a";
                            String fina2 = "$b1" + "-" + "$c1" + "-" + "$a1";

                            var headers = {'Content-Type': 'application/json'};
                            var request = http.Request('POST',
                                Uri.parse('http://192.168.0.104:8080/agent/add'));
                            request.body = json.encode({
                              "dateAppointed": fina,
                              "exclusive": exclusive.text,
                              "previousAgent": previous.text,
                              "prevDateOfTermination": fina2,
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
                              print("Success");
                            } else {
                              print(response.reasonPhrase);
                            }
                          }
                        },
                        icon: Icon(Icons.done),
                      ),
                    )),
                Expanded(
                    child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: TextFormField(
                        controller: date,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 5.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          hintText: "Date Appointed",
                          labelText: "Date Appointed",
                          prefixIcon: IconButton(
                            icon: Icon(Icons.calendar_today_rounded),
                            onPressed: () {
                              setState(() {
                                _selectDate(context);
                              });
                            },
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
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
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            focusNode: myFocusNode,
                            cornerRadius: BorderRadius.circular(14.0),
                          ),
                          AnimatedTextFormField(
                            width: 180,
                            height: 48.0,
                            inputType: TextInputType.text,
                            hintText: "Previous Agent",
                            controller: previous,
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            focusNode: myFocusNode1,
                            cornerRadius: BorderRadius.circular(14.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: TextFormField(
                        controller: date2,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 5.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          hintText: "Date of Termination",
                          labelText: "Date of Termination",
                          prefixIcon: IconButton(
                            icon: Icon(Icons.calendar_today_rounded),
                            onPressed: () {
                              setState(() {
                                _selectDate2(context);
                              });
                            },
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                      ),
                    ),
                    AnimatedTextFormField(
                      width: MediaQuery.of(context).size.width * 0.875,
                      height: 48.0,
                      inputType: TextInputType.text,
                      hintText: "Distribution Channel",
                      controller: distribution,
                      textStyle: TextStyle(
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
                            textStyle: TextStyle(
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
                            textStyle: TextStyle(
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
                      textStyle: TextStyle(
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
                      textStyle: TextStyle(
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
                            textStyle: TextStyle(
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
                            textStyle: TextStyle(
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
                            textStyle: TextStyle(
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
                            textStyle: TextStyle(
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
                            textStyle: TextStyle(
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
                            textStyle: TextStyle(
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
                            textStyle: TextStyle(
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
                            textStyle: TextStyle(
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
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      focusNode: myFocusNode15,
                      cornerRadius: BorderRadius.circular(14.0),
                    ),
                    FutureBuilder(
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        List<ClientData> clientList = [];
                        if (snapshot.hasData) {
                          clientList.clear();
                          clientList = snapshot.data;
                          int indexofbank = 0;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 300,
                                height: 70,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButtonFormField2(
                                    value: clientList.isNotEmpty ? clientList[indexofbank] : "empty",
                                    isExpanded: true,
                                    hint: const Text(
                                      'Client',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    items: clientList
                                        .map((ClientData value) =>
                                        DropdownMenuItem<ClientData>(
                                          value: value,
                                          child: Text(
                                            value.givenName
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                        .toList(),
                                    onChanged: (value) {
                                      ClientData addresspre = value as ClientData;
                                      setState(() {
                                        indexofbank = clientList.indexOf(value);
                                        clientID = addresspre.id;
                                      });
                                    },
                                    onSaved: (value) {
                                      ClientData addresspre = value as ClientData;
                                      setState(() {
                                        indexofbank = clientList.indexOf(value);
                                        clientID = addresspre.id;
                                      });
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
                                                    .leftToRight,
                                                child:
                                                const ClientRegistrationScreen()));
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
                    SizedBox(
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
