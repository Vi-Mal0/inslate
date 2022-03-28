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
                  title: const Text(
                    "Bank Account",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing:     IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BankRegistrationScreen())).then((_) => _refreshData());
                  }, icon: const Icon(Icons.add)),
                )),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshData,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FutureBuilder(builder: (
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
                                          IconButton(onPressed: () {
                                            serviceApi.deleteBank(bankAccount.id);
                                            setState(() {
                                            });

                                          }, icon: Icon(Icons.delete)

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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}