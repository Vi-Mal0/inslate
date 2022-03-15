import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/Screens/Bucket.dart';
import 'package:insuranceprototype/Screens/Dashboard.dart';
import 'package:insuranceprototype/Screens/RegistrationScreen.dart';

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

  void refreshData() {}

  onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  void navigateCandidateList() {
    Route route = MaterialPageRoute(builder: (context) => CandidateList());
    Navigator.push(context, route).then(onGoBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: Stack(
          children: <Widget>[
            Container(
              height: 200,
              child: DrawerHeader(
                child: Row(
                  children: const [
                    CircleAvatar(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("User Name"),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.21,
              child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationScreen()));
                  },
                  child: const Text("RegistrationScreen")),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    '2022 (c) FuturaInsTech.com',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ))
          ],
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.white
                            : Colors.black,
                      )),
                  Text(
                    "management",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.white
                            : Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      PopupMenuButton(
                        color: (Theme.of(context) == Brightness.dark)
                            ? Colors.white
                            : Colors.black,
                        itemBuilder: (context) => [
                          PopupMenuItem<int>(
                            value: 0,
                            child: SizedBox(
                                width: 100,
                                child: Text(
                                  "Setting ",
                                  style: TextStyle(
                                      color:
                                          (Theme.of(context) == Brightness.dark)
                                              ? Colors.white
                                              : Colors.black),
                                )),
                          ),
                          PopupMenuItem<int>(
                            value: 1,
                            child: SizedBox(
                                width: 100,
                                child: Text(
                                  "About ",
                                  style: TextStyle(
                                      color:
                                          (Theme.of(context) == Brightness.dark)
                                              ? Colors.white
                                              : Colors.black),
                                )),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: SizedBox(
                                width: 100,
                                child: Text(
                                  "Exit ",
                                  style: TextStyle(
                                      color:
                                          (Theme.of(context) == Brightness.dark)
                                              ? Colors.white
                                              : Colors.black),
                                )),
                          ),
                        ],
                        onSelected: (item) => {print(item)},
                      ),
                    ],
                  )
                ],
              ),
            ),
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
          navigateCandidateList();
        },
        child: Icon(Icons.list_alt),
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
