import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Screens/CandidateProfile.dart';
import 'package:page_transition/page_transition.dart';

import '../Model/Candidate.dart';

class CandidateList extends StatefulWidget {
  CandidateList({Key? key}) : super(key: key);

  @override
  _CandidateListState createState() => _CandidateListState();
}

class _CandidateListState extends State<CandidateList> {

  @override
  void initState() {
    super.initState();
  }

  void refreshData() {}

  onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  void navigateSecondPage(id) {
    Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft,
                child: CandidateProfile(id)))
        .then(onGoBack);
  }

  HttpService http = HttpService();
  List<Candidate> all = [];
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
      body: Column(
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
                    Icons.arrow_back,
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
            child: FutureBuilder(
              future: http.getCandidate(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Candidate>? e = snapshot.data;
                  if (isSearch) {
                    e?.clear();
                    e = _SearchResult;
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 0.0),
                    itemCount: e?.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          navigateSecondPage(e?[index].id);
                        },
                        child: SizedBox(
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ProfilePicture(
                                name: e?[index].name,
                                radius: 31,
                                fontsize: 21,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${e?[index].name}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${e?[index].email}",
                                    style: const TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              if (e?[index].currentStatus == "Assigned") ...[
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.cyan,
                                  ),
                                  child: Text(
                                    e?[index].currentStatus,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ] else if (e?[index].currentStatus ==
                                  "Captured") ...[
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.yellow,
                                  ),
                                  child: Text(
                                    e?[index].currentStatus,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ] else if (e?[index].currentStatus == "Passed") ...[
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green,
                                  ),
                                  child: Text(
                                    e?[index].currentStatus,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ] else if (e?[index].currentStatus == "Failed") ...[
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red,
                                  ),
                                  child: Text(
                                    e?[index].currentStatus,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ]
                            ],
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
    );
  }
}
