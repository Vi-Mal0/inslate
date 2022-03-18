import 'package:flutter/material.dart';
import 'package:insuranceprototype/Screens/AgentListScreen.dart';
import 'package:page_transition/page_transition.dart';

import '../HTTP/HttpService.dart';
import '../Model/Agent.dart';

class EditAgentPage extends StatefulWidget {
  int? id;
  EditAgentPage({Key? key, required this.id});

  @override
  State<EditAgentPage> createState() => _EditAgentPageState();
}

class _EditAgentPageState extends State<EditAgentPage> {
  HttpService api = HttpService();

  @override
  Widget build(BuildContext context) {
    print("hello ${widget.id}");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              TextEditingController id =
                  TextEditingController(text: snapshot.data.id.toString());
              TextEditingController dateapp = TextEditingController(
                  text: snapshot.data.dateAppointed.toString());
              TextEditingController exclusive = TextEditingController(
                  text: snapshot.data.exclusive.toString());
              TextEditingController previous = TextEditingController(
                  text: snapshot.data.previousAgent.toString());
              TextEditingController termin = TextEditingController(
                  text: snapshot.data.prevDateOfTermination.toString());
              TextEditingController distri = TextEditingController(
                  text: snapshot.data.distributionChannel.toString());

              TextEditingController branch =
                  TextEditingController(text: snapshot.data.branch.toString());
              TextEditingController areaCode = TextEditingController(
                  text: snapshot.data.areaCode.toString());
              TextEditingController agentType = TextEditingController(
                  text: snapshot.data.agentType.toString());
              TextEditingController reportingTo = TextEditingController(
                  text: snapshot.data.reportingTo.toString());
              TextEditingController payMethod = TextEditingController(
                  text: snapshot.data.payMethod.toString());
              TextEditingController payFrequency = TextEditingController(
                  text: snapshot.data.payFrequency.toString());

              TextEditingController currencyType = TextEditingController(
                  text: snapshot.data.currencyType.toString());
              TextEditingController minimumAmount = TextEditingController(
                  text: snapshot.data.minimumAmount.toString());
              TextEditingController bonusAllocation = TextEditingController(
                  text: snapshot.data.bonusAllocation.toString());
              TextEditingController basicCommission = TextEditingController(
                  text: snapshot.data.basicCommission.toString());

              TextEditingController renewalCommission = TextEditingController(
                  text: snapshot.data.renewalCommission.toString());
              TextEditingController servicingCommission = TextEditingController(
                  text: snapshot.data.servicingCommission.toString());
              TextEditingController commissionClass = TextEditingController(
                  text: snapshot.data.commissionClass.toString());

              return Form(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      SizedBox(height: 10),
                      TextFormField(
                        controller: id,
                        decoration: const InputDecoration(
                          labelText: "ID",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: dateapp,
                        decoration: const InputDecoration(
                          labelText: "Date Appointed",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: exclusive,
                        decoration: const InputDecoration(
                          labelText: "Exclusive",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: previous,
                        decoration: const InputDecoration(
                          labelText: "Previous Agent",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: termin,
                        decoration: const InputDecoration(
                          labelText: "Date of Termination",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: distri,
                        decoration: const InputDecoration(
                          labelText: "Distribution Channel",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: branch,
                        decoration: const InputDecoration(
                          labelText: "Branch",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: areaCode,
                        decoration: const InputDecoration(
                          labelText: "Area Code",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: agentType,
                        decoration: const InputDecoration(
                          labelText: "Agent Type",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: reportingTo,
                        decoration: const InputDecoration(
                          labelText: "Reporting To",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: payMethod,
                        decoration: const InputDecoration(
                          labelText: "Pay Method",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: branch,
                        decoration: const InputDecoration(
                          labelText: "Branch",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: payFrequency,
                        decoration: const InputDecoration(
                          labelText: "Pay Frequency",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: currencyType,
                        decoration: const InputDecoration(
                          labelText: "Currency Type",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: minimumAmount,
                        decoration: const InputDecoration(
                          labelText: "Minimum Amount",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: bonusAllocation,
                        decoration: const InputDecoration(
                          labelText: "Bonus Allocation",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: basicCommission,
                        decoration: const InputDecoration(
                          labelText: "Basic Commission",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: renewalCommission,
                        decoration: const InputDecoration(
                          labelText: "Renewal Commission",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: servicingCommission,
                        decoration: const InputDecoration(
                          labelText: "Servicing Commission",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: commissionClass,
                        decoration: const InputDecoration(
                          labelText: "Commission Class",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      IconButton(
                          onPressed: () {
                            bool b = previous.text.toLowerCase() == 'true';

                            Navigator.pop(context);

                            api.updateAgent(
                                widget.id,
                                Agent(
                                  dateAppointed: dateapp.text,
                                  exclusive: exclusive.text,
                                  previousAgent: b,
                                  prevDateOfTermination: termin.text,
                                  distributionChannel: distri.text,
                                  branch: branch.text,
                                  areaCode: areaCode.text,
                                  agentType: agentType.text,
                                  reportingTo: reportingTo.text,
                                  payMethod: payMethod.text,
                                  payFrequency: payFrequency.text,
                                  currencyType: currencyType.text,
                                  minimumAmount: minimumAmount.text,
                                  bonusAllocation: bonusAllocation.text,
                                  basicCommission: basicCommission.text,
                                  renewalCommission: renewalCommission.text,
                                  servicingCommission: servicingCommission.text,
                                  commissionClass: commissionClass.text,
                                ));
                          },
                          icon: const Icon(Icons.done))
                    ]),
                  ),
                ),
              );
            }

            return const CircularProgressIndicator();
          },
          future: api.getAgentById(widget.id),
        ));
  }
}
