import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/Model/Candidate.dart';
import 'package:insuranceprototype/Model/ClientData.dart';

import '../HTTP/HttpService.dart';

class ClientProfileScreen extends StatefulWidget {
  int id;
  ClientProfileScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ClientProfileScreen> createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {

  HttpService http = HttpService();
  List<ClientData> all = [];
  TextEditingController controller = TextEditingController();
  bool isSearch = false;
  final List<Candidate> _SearchResult = [];


  onSearchTextChanged(String text) async {
    if (text.isNotEmpty) {
      _SearchResult.clear();
      http.searchCandidate(text).then((value) {
        for (var e in value) {
          _SearchResult.add(e);
        }
      });
      setState(() {
        isSearch = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: http.getClientbyId(widget.id),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            ClientData client= snapshot.data;
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_downward_rounded,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                          ),
                          onChanged: onSearchTextChanged,
                        ),
                      ),
                      PopupMenuButton(
                        color: Colors.white,
                        itemBuilder: (context) => [
                          const PopupMenuItem<int>(
                            value: 0,
                            child: SizedBox(
                                width: 100,
                                child: Text(
                                  "Setting ",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          PopupMenuItem<int>(
                            value: 1,
                            child: Container(
                                width: 100,
                                child: Text(
                                  "About ",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Container(
                                width: 100,
                                child: Text(
                                  "Exit ",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ],
                        onSelected: (item) => {print(item)},
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black38,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
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
                            client.givenName.toString() + " " + client.surName.toString(),
                            style:
                            const TextStyle(fontSize: 24, letterSpacing: 2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(client.birthDate.toString()),

                        const SizedBox(
                          height: 10,
                        ),
                        Text(client.address.toString()),
                      ],
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
