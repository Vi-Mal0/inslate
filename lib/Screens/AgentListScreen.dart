import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Screens/AgentEdit.dart';
import 'package:page_transition/page_transition.dart';

import '../Model/Agent.dart';

class AgentListScreen extends StatefulWidget {
  const AgentListScreen({Key? key}) : super(key: key);

  @override
  State<AgentListScreen> createState() => _AgentListScreenState();
}

class _AgentListScreenState extends State<AgentListScreen> {
  @override
  void initState() {
    super.initState();
  }

  void refreshData() {}

  onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }


  HttpService http = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                ),
                title: Text("Agent List"),
              )
            ),
            const Divider(
              color: Colors.black38,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            Expanded(
              child: FutureBuilder(
                future: http.getAgent(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Agent>? e = snapshot.data;
                    return ListView.builder(
                      padding: const EdgeInsets.only(top: 0.0),
                      itemCount: e?.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {

                          },
                          child: Card(
                            child: ListTile(
                              title: Text("${e?[index].client?.givenName}"),
                              leading:  Text("${e?[index].id.toString()}"),
                              trailing: Wrap(
                                spacing: 12, // space between two icons
                                children: <Widget>[
                                  IconButton(icon:(const Icon(Icons.view_agenda_outlined)), onPressed: () {
                                    setState(() {
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible: false, // user must tap button!
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Agent Details'),
                                            content: SingleChildScrollView(
                                              child: ListBody(
                                                children:  <Widget>[
                                                  Text('Date Appointed:${e?[index].dateAppointed.toString()}'),
                                                  Text('Exclusive:${e?[index].exclusive.toString()}'),
                                                  Text('Previous Agent:${e?[index].previousAgent.toString()}'),
                                                  Text('Date of Termination:${e?[index].prevDateOfTermination.toString()}'),
                                                  Text('Distribution Channel:${e?[index].distributionChannel.toString()}'),
                                                  Text('Branch:${e?[index].branch.toString()}'),
                                                  Text('Area Code:${e?[index].areaCode.toString()}'),
                                                  Text('Agent Type:${e?[index].agentType.toString()}'),
                                                  Text('Reporting To:${e?[index].reportingTo.toString()}'),
                                                  Text('Pay Method:${e?[index].payMethod.toString()}'),
                                                  Text('Pay Frequency:${e?[index].payFrequency.toString()}'),
                                                  Text('Currency Type:${e?[index].currencyType.toString()}'),
                                                  Text('Minimum Amount:${e?[index].minimumAmount.toString()}'),
                                                  Text('Bonus Allocation:${e?[index].bonusAllocation.toString()}'),
                                                  Text('Basic Commission:${e?[index].basicCommission.toString()}'),
                                                  Text('Renewal Commission:${e?[index].renewalCommission.toString()}'),
                                                  Text('Servicing Commission:${e?[index].servicingCommission.toString()}'),
                                                  Text('Commission Class:${e?[index].commissionClass.toString()}'),

                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('Ok'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    });
                                  },), // icon-1
                                  IconButton(onPressed: () { setState(() {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.rightToLeft,
                                            child: AgentEdit(id:e?[index].id)))
                                        .then(onGoBack);
                                  }); }, icon: Icon(Icons.edit),), // icon-2
                                ],
                              ),

                            ),
                          ),
                        );
                      },
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
            ),
          ],
        ),
      ),
    );
  }
}
