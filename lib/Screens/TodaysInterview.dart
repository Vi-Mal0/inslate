import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:page_transition/page_transition.dart';

import '../Model/Candidate.dart';
import 'CandidateProfile.dart';

class Todaysinterview extends StatefulWidget {
  int id;
  Todaysinterview({Key? key, required this.id}) : super(key: key);

  @override
  State<Todaysinterview> createState() => _TodaysinterviewState();
}

class _TodaysinterviewState extends State<Todaysinterview> {
  TextEditingController controller = TextEditingController();
  final List<Candidate> _SearchResult = [];
  bool isSearch = false;
  HttpService api = HttpService();

  onSearchTextChanged(String text) async {
    if (text.isNotEmpty) {
      _SearchResult.clear();
      api.searchCandidate(text).then((value) {
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
                        const PopupMenuItem<int>(
                          value: 1,
                          child: SizedBox(
                              width: 100,
                              child: Text(
                                "About ",
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                        const PopupMenuItem<int>(
                          value: 2,
                          child: SizedBox(
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
                  future: api.gettoday(widget.id),
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
                              Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child:
                                              CandidateProfile(e?[index].id)))
                                  .then((_) => _refreshData());
                            },
                            child: SizedBox(
                              height: 60,
                              child: Center(
                                child: ListTile(
                                  leading: ProfilePicture(
                                    name: e?[index].name,
                                  ),
                                  title:Text("${e?[index].name}") ,
                                ),
                              )
                            ),
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
