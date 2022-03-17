import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Model/Bank.dart';

class BankRegistrationScreen extends StatefulWidget {
  const BankRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<BankRegistrationScreen> createState() => _BankRegistrationScreenState();
}

class _BankRegistrationScreenState extends State<BankRegistrationScreen> {
  HttpService api = HttpService();
  TextEditingController quantsaccName = TextEditingController();
  TextEditingController quantsaccNo = TextEditingController();
  TextEditingController quantsbankName = TextEditingController();
  TextEditingController quantsifscCode = TextEditingController();
  TextEditingController quantsbankBranch = TextEditingController();

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
                    "Add bank account",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      api.createBank(BankAccount(
                        accountHolderName: quantsaccName.text,
                        accountNumber: quantsaccNo.text,
                        bankName: quantsbankName.text,
                        bankBranch: quantsbankBranch.text,
                        ifscCode: quantsifscCode.text,
                      ));
                    },
                    icon: const Icon(Icons.done,color: Colors.black,),
                  ),
                )),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  TextFormField(
                    controller: quantsaccName,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Account name"),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: quantsaccNo,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Account no"),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: quantsbankName,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Bank name"),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: quantsifscCode,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "IFSC"),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: quantsbankBranch,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Bank branch"),
                  ),
                  const SizedBox(height: 10),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
