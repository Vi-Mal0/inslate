import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Todaysinterview extends StatefulWidget {
  const Todaysinterview({Key? key}) : super(key: key);

  @override
  State<Todaysinterview> createState() => _TodaysinterviewState();
}

class _TodaysinterviewState extends State<Todaysinterview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height* 0.03,0,0),
        child: Container(child: Text("todays"),),
      ),
    );
  }
}

