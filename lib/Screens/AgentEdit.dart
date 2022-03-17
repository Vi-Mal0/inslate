import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgentEdit extends StatefulWidget {
  int? id;
  AgentEdit({Key? key,required this.id}) : super(key: key);

  @override
  State<AgentEdit> createState() => _AgentEditState();
}

class _AgentEditState extends State<AgentEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [

          ],
        ),
      ),
    );
  }
}
