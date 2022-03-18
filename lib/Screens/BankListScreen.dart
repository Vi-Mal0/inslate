import 'package:flutter/material.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Model/Bank.dart';
import 'package:insuranceprototype/Screens/BankRegisterScreen.dart';

import 'BankEdit.dart';

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {

  HttpService serviceApi = HttpService();
  String value = "";

  Future<void> _refreshData() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Agent BankAccount"),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => BankRegistrationScreen())).then((_) => _refreshData());
            }, icon: const Icon(Icons.add))
          ]
      ),
      body: FutureBuilder(builder: (
          BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              BankAccount bankAccount = snapshot.data[index];
              return InkWell(
                child: Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Account Name: ${bankAccount.accountHolderName}"),
                              Text("Account No: ${bankAccount.accountNumber}"),
                              Text("Bank Name: ${bankAccount.bankName}"),
                              Text("IFSC code: ${bankAccount.ifscCode}"),
                              Text("Bank Branch: ${bankAccount.bankBranch}"),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage(id: snapshot.data[index].id)));
                              }, icon: Icon(Icons.edit)
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator(),);
      },
        future: serviceApi.getBank(),
      ),
    );
  }
}