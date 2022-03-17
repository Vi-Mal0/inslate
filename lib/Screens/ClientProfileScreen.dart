import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/Model/Candidate.dart';
import 'package:insuranceprototype/Model/ClientData.dart';
import 'package:insuranceprototype/Screens/ProofAdd.dart';
import 'package:page_transition/page_transition.dart';

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

  Future<void> _refreshData() async {
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: FutureBuilder(
            future: http.getClientbyId(widget.id),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
             if(snapshot.hasData){
               ClientData client = snapshot.data;
               return Column(
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
                             Icons.arrow_back_rounded,
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
                         IconButton(onPressed: (){
                           Navigator.push(
                               context,
                               PageTransition(
                                   type: PageTransitionType.rightToLeft,
                                   child: ProofAdd(id: widget.id,)));
                         }, icon: const Icon(Icons.add))
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
                               client.givenName.toString() +
                                   " " +
                                   client.surName.toString(),
                               style: const TextStyle(fontSize: 24, letterSpacing: 2),
                             ),
                           ),
                           const SizedBox(
                             height: 10,
                           ),
                           Text(client.birthDate.toString()),
                           const SizedBox(
                             height: 10,
                           ),
                           Text(client.toString()),
                         ],
                       ))
                 ],
               );
             }
             return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
