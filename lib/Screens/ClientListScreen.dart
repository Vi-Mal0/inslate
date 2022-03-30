import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Model/ClientData.dart';
import 'package:insuranceprototype/Screens/ClientEdit.dart';
import 'package:insuranceprototype/Screens/ClientProfileScreen.dart';
import 'package:page_transition/page_transition.dart';

import 'CandidateProfile.dart';

class ClientListScreen extends StatefulWidget {
  const ClientListScreen({Key? key}) : super(key: key);

  @override
  State<ClientListScreen> createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> {
  HttpService api = HttpService();

  Future<void> _refreshData() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
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
                      "Client List",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )),
              Expanded(
                  child: FutureBuilder(
                future: api.getClient(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  List<ClientData> client = snapshot.data;
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: client.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: ClientProfileScreen(
                                      id: int.parse(
                                          client[index].id.toString()),
                                    ))).then((_){setState(() { });});
                          },
                          child: Card(
                            child: ListTile(
                              leading: ProfilePicture(
                                name: client[index].givenName,
                              ),
                              title: Text(
                                  "${client[index].givenName}  ${client[index].surName}"),
                              trailing: IconButton(
                                onPressed: () async {
                                  await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return ClientEdit(
                                      id: int.parse(
                                          client[index].id.toString()),
                                    );
                                  }));
                                  setState(() {

                                  });
                                },
                                icon: const Icon(Icons.edit),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return CircularProgressIndicator();
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
