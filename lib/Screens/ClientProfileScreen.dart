import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Screens/ProofAdd.dart';
import 'package:page_transition/page_transition.dart';

import '../Model/ClientData.dart';

class ClientProfileScreen extends StatefulWidget {
  int id;
  ClientProfileScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ClientProfileScreen> createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  HttpService http = HttpService();

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
          child: FutureBuilder(
            future: http.getClientbyId(widget.id),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                ClientData client = snapshot.data;
                return Column(
                  children: [
                    SizedBox(
                        height: 50,
                        child: ListTile(
                          leading: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                            ),
                          ),
                          title: Text("Client Profile"),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: ProofAdd(id: widget.id)));
                            },
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),
                        )),
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
                            client.salutation.toString() +
                                " " +
                                client.givenName.toString() +
                                " " +
                                client.surName.toString(),
                            style:
                                const TextStyle(fontSize: 24, letterSpacing: 2),
                          ),
                        ),

                      ],
                    ))
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
