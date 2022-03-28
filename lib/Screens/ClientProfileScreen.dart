import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Screens/ProofAdd.dart';
import 'package:page_transition/page_transition.dart';

import '../Model/ClientData.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();


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
      key: _scaffoldState,
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
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.rightToLeft,
                                              child: ProofAdd(id: widget.id)))
                                      .then((value) => _refreshData());
                                  _refreshData();
                                },
                                icon: const Icon(
                                  Icons.add,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  http.deleteClient(widget.id).then((isSuccess) {
                                    if (isSuccess) {

                                    } else {
                                      Scaffold.of(this.context)
                                          .showSnackBar(SnackBar(content: Text("Delete data failed")));
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                ),
                              ),
                            ],
                          ),
                        )),
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
                        style: const TextStyle(fontSize: 24, letterSpacing: 2),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text("Marrital Status : ${client.marritalStatus}"),
                          Text("Birthdate : ${client.birthDate}"),
                          Text("Occupation : ${client.occupation}"),
                          Text("Gender : ${client.gender}"),
                          Text("language : ${client.language}"),
                          Text("Birthplace : ${client.birthPlace}"),
                          Text("Nationality : ${client.nationality}"),
                          Text("Postalcode : ${client.postalCode}"),
                          Text("Country : ${client.country}"),
                          Text("Mobilenumber : ${client.mobileNumber}"),
                          Text("Proof"),
                        ],
                      ),
                    ),
                    if(client.proofList?.length != 0) Expanded(
                        child: ListView.builder(
                            itemCount: client.proofList?.length,
                            itemBuilder: (BuildContext context, int index) {
                              String uri =
                                  'data:image/gif;base64,${client.proofList?[index].proofFile}';
                              Uint8List _bytes;
                              _bytes = base64.decode(uri.split(',').last);
                              return InkWell(
                                child: Card(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Proof Code: ${client.proofList?[index].proofPurpose}"),
                                          Text(
                                              "Proof Id: ${client.proofList?[index].proofID}"),
                                          Text(
                                              "Proof Name: ${client.proofList?[index].proofName}"),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            child: IconButton(
                                                onPressed: () {
                                                  showDialog<void>(
                                                    context: context,
                                                    barrierDismissible:
                                                        false, // user must tap button!
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Proof Image'),
                                                        content:
                                                            SingleChildScrollView(
                                                          child: ListBody(
                                                            children: <Widget>[
                                                              GestureDetector(
                                                                onTap: () {},
                                                                child:
                                                                    Container(
                                                                  height: 300,
                                                                  width: 300,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .purple),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    margin: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            2.0),
                                                                    width:
                                                                        500.0,
                                                                    height:
                                                                        800.0,
                                                                    child: Image
                                                                        .memory(
                                                                            _bytes),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: const Icon(Icons
                                                    .view_agenda_outlined)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }))
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
