import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Screens/CandidateProfile.dart';
import 'package:page_transition/page_transition.dart';

import '../Model/Candidate.dart';

class CandidateList extends StatefulWidget {
  const CandidateList({Key? key}) : super(key: key);

  @override
  _CandidateListState createState() => _CandidateListState();
}

class _CandidateListState extends State<CandidateList> {
  HttpService http = HttpService();
  List<Candidate> all = [];
  TextEditingController controller = TextEditingController();
  bool isSearch = false;
  final List<Candidate> _SearchResult = [];

  navigatorPush(id) {
    Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.leftToRight,
                child: CandidateProfile(id)))
        .then((_) => _refreshData());
  }

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

  Future<void> _refreshData() async {
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                  title:  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                      onChanged: onSearchTextChanged,
                    ),
                  ),
                )),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshData,
                child: FutureBuilder(
                  builder: (BuildContext context,
                      AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              navigatorPush(snapshot.data[index].id);
                              setState(() {
                              });
                            },
                            child:Container(
                              color: index % 2 == 0 ? Colors.white : Colors.grey[200],
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  leading: ProfilePicture(
                                    name: snapshot.data[index].name.toString(),
                                  ),
                                  title: Text("${snapshot.data[index].name}"),
                                ),
                              ),
                            )
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  future: http.getCandidate(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
