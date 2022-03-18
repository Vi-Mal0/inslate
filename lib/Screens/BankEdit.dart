import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Model/Bank.dart';
import 'BankListScreen.dart';

class EditPage extends StatefulWidget {
  int id;
  EditPage({Key? key, required this.id});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  HttpService api = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              BankAccount bank = snapshot.data;
              TextEditingController quantsId =
              TextEditingController(text: bank.id.toString());
              TextEditingController quantsaccName =
              TextEditingController(text: bank.accountHolderName.toString());
              TextEditingController quantsaccNo =
              TextEditingController(text: bank.accountNumber.toString());
              TextEditingController quantsbankName = TextEditingController(
                  text: bank.bankName.toString());
              TextEditingController quantsifscCode = TextEditingController(
                  text: bank.ifscCode.toString());
              TextEditingController quantsbankBranch = TextEditingController(
                  text: bank.bankBranch.toString());
              return Form(
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(height: 10),
                    TextFormField(
                      controller: quantsId,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: "ID",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: quantsaccName,
                      decoration: const InputDecoration(
                        labelText: "Account Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: quantsaccNo,
                      decoration: const InputDecoration(
                        labelText: "Account No",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: quantsbankName,
                      decoration: const InputDecoration(
                        labelText: "bank name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: quantsifscCode,
                      decoration: const InputDecoration(
                        labelText: "ifcs code",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: quantsbankBranch,
                      decoration: const InputDecoration(
                        labelText: "bank branch",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);

                          api.updateBank(widget.id,BankAccount(
                            accountHolderName: quantsaccName.text,
                            accountNumber: quantsaccNo.text,
                            bankName: quantsbankName.text,
                            bankBranch: quantsbankBranch.text,
                            ifscCode: quantsifscCode.text,
                          ));

                        },
                        icon: const Icon(Icons.done))
                  ]),
                ),
              );
            }

            return const CircularProgressIndicator();
          },
          future: api.getBankById(widget.id),
        ));
  }
}
