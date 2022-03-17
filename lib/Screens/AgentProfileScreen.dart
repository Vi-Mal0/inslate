import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgentProfileScreen extends StatefulWidget {
  int id;
  AgentProfileScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<AgentProfileScreen> createState() => _AgentProfileScreenState();
}

class _AgentProfileScreenState extends State<AgentProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: const [

          ],
        ),
      ),
    );
  }
}
