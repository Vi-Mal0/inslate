import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/Screens/EmployeeProfile.dart';
import 'package:insuranceprototype/Screens/HomeScreen.dart';
import 'package:insuranceprototype/Screens/admin/AdminDashboard.dart';
import 'package:insuranceprototype/Screens/RegistrationScreen.dart';

class LandingScreen extends StatefulWidget {
  String id;
  LandingScreen(this.id,{Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int selectedIndex = 0;
  int currentIndex = 0;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> screens = [
      HomeScreen(widget.id),
      const AdminDashboard(),
      EmployeeProfile(int.parse(widget.id)),
    ];

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer:Drawer(
                child: Stack(
                children: <Widget>[
                  Container(
                    height: 200,
                    child: DrawerHeader(child: Row(
                      children: const [
                              CircleAvatar(),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("User Name"),
                              )
                      ],
                    )),
                  ),
                  const Positioned(
                    top: 10,
                      right: 12,
                      child: Icon(Icons.settings)
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height*0.21,
                    child: FlatButton(onPressed: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegistrationScreen()));
                      }, child: const Text("RegistrationScreen")),
                  ),
                Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.04,
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
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed:(){scaffoldKey.currentState?.openDrawer();}, icon: const Icon(Icons.menu)),
                  const Text("Management App",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // IconButton(
                    //     onPressed: () {}, icon: const Icon(Icons.search)),
                    Padding(
                      padding:EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.433,0,0,0),
                      child: PopupMenuButton(
                        color: Colors.white,
                        itemBuilder: (context) => [
                          const PopupMenuItem<int>(
                            value: 0,
                            child: SizedBox(width: 100 ,child: Text("Setting ",style: TextStyle(color: Colors.black),)),
                          ),
                          const PopupMenuItem<int>(
                            value: 1,
                            child: SizedBox(width: 100 ,child: Text("About ",style: TextStyle(color: Colors.black),)),
                          ),
                          const PopupMenuItem<int>(
                            value: 2,
                            child: SizedBox(width: 100 ,child: Text("Exit ",style: TextStyle(color: Colors.black),)),
                          ),
                        ],
                        onSelected: (item) => {print(item)},
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: screens[selectedIndex],
            ))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home" ),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: "Admin"),
            BottomNavigationBarItem(icon: Icon(Icons.stay_current_portrait_sharp), label: "Bucket"),
          ],
          currentIndex: selectedIndex,
          fixedColor: Colors.deepPurple,
          onTap: onItemTapped,
        ),
      ),
    );
  }
}
