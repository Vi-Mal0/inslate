import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insuranceprototype/Screens/AddressListScreen.dart';
import 'package:insuranceprototype/Screens/AgentListScreen.dart';
import 'package:insuranceprototype/Screens/AgentRegistrationScreen.dart';
import 'package:insuranceprototype/Screens/BankListScreen.dart';
import 'package:insuranceprototype/Screens/Bucket.dart';
import 'package:insuranceprototype/Screens/ClientListScreen.dart';
import 'package:insuranceprototype/Screens/ClientRegistrationScreen.dart';
import 'package:insuranceprototype/Screens/Dashboard.dart';
import 'package:insuranceprototype/Screens/EventLogList.dart';
import 'package:insuranceprototype/Screens/ProofList.dart';
import 'package:insuranceprototype/Screens/RegistrationScreen.dart';
import 'package:page_transition/page_transition.dart';

import 'CandidateList.dart';

class LandingScreen extends StatefulWidget {
  String id;
  LandingScreen(this.id, {Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int _pageIndex = 0;
  PageController _pageController = PageController();

  List<Widget> tabPages = [
    Dashboard("51"),
    Bucket(int.parse("51")),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool homePop = false;
  int backCount = 0;

  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Do you want to exit an App?'),
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xffbe61565)),
                ),
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xffbe61565)),
                ),
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: EventLogList(id: int.parse(widget.id))));
                    },
                    child: SizedBox(
                      height: 70,
                      child: Card(
                        child: Center(
                          child: Row(
                            children: const [
                              Icon(Icons.info_outline_rounded),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Event Logs"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const ClientRegistrationScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      child: Card(
                        child: Center(
                          child: Row(
                            children: const [
                              Icon(Icons.info_outline_rounded),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Client Registration"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const ClientListScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      child: Card(
                        child: Center(
                          child: Row(
                            children: const [
                              Icon(Icons.people),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Client List"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const AgentRegistrationScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      child: Card(
                        child: Center(
                          child: Row(
                            children: const [
                              Icon(Icons.people),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Agent Registration"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const AgentListScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      child: Card(
                        child: Center(
                          child: Row(
                            children: const [
                              Icon(Icons.people),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Agent List"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const Display()));
                    },
                    child: SizedBox(
                      height: 70,
                      child: Card(
                        child: Center(
                          child: Row(
                            children: const [
                              Icon(Icons.people),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Bank List"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const Home()));
                    },
                    child: SizedBox(
                      height: 70,
                      child: Card(
                        child: Center(
                          child: Row(
                            children: const [
                              Icon(Icons.people),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Address List"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const ProofView()));
                    },
                    child: SizedBox(
                      height: 70,
                      child: Card(
                        child: Center(
                          child: Row(
                            children: const [
                              Icon(Icons.people),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Proof List"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              0, MediaQuery.of(context).size.height * 0.03, 0, 0),
          child: Column(
            children: [
              Container(
                  color: (Theme.of(context).brightness == Brightness.dark)
                      ? Colors.black
                      : Colors.white,
                  child: ListTile(
                    leading: IconButton(
                        onPressed: () {
                          scaffoldKey.currentState?.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          color:
                              (Theme.of(context).brightness == Brightness.dark)
                                  ? Colors.white
                                  : Colors.black,
                        )),
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
                      child: Text(
                        "Management",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: (Theme.of(context).brightness ==
                                    Brightness.dark)
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  )),
              Expanded(
                  child: PageView(
                children: tabPages,
                onPageChanged: onPageChanged,
                controller: _pageController,
              ))
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: const Color(0xffbe61565),
          elevation: 0,
          currentIndex: _pageIndex,
          onTap: onTabTapped,
          backgroundColor: (Theme.of(context).brightness == Brightness.dark)
              ? Colors.black
              : Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.stay_current_portrait_sharp), label: "Bucket"),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffbe61565),
          onPressed: () {
            Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.bottomToTop,
                        child: const CandidateList()))
                .then((value) {
              setState(() {});
            });
          },
          child: Icon(Icons.list_alt),
        ),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
