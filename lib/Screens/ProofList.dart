import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../Model/Proof.dart';

class ProofView extends StatefulWidget {
  const ProofView({Key? key}) : super(key: key);

  @override
  State<ProofView> createState() => _ProofViewState();
}

class _ProofViewState extends State<ProofView> {
  HttpService serviceApi = HttpService();
  String? proofCode;
  String? proofId;
  String? proofName;
  String? proof;

  final ImagePicker _picker = ImagePicker();
  XFile? image;

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
                    "Proof",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshData,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FutureBuilder(
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              String uri =
                                  'data:image/gif;base64,${snapshot.data[index].proofFile}';
                              Uint8List _bytes;
                              _bytes = base64.decode(uri.split(',').last);
                              return InkWell(
                                child: Card(
                                  color: Colors.grey[200],
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Proof Code: ${snapshot.data[index].proofPurpose}"),
                                          Text(
                                              "Proof Id: ${snapshot.data[index].proofID}"),
                                          Text(
                                              "Proof Name: ${snapshot.data[index].proofName}"),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            child: IconButton(
                                                onPressed: () {
                                                  showDialog<void>(
                                                    context: context,
                                                    barrierDismissible:
                                                    false, // user must tap button!
                                                    builder: (BuildContext context) {
                                                      return AlertDialog(
                                                        title: const Text('Proof Image'),
                                                        content: SingleChildScrollView(
                                                          child: ListBody(
                                                            children: <Widget>[
                                                              GestureDetector(
                                                                onTap: () {},
                                                                child: Container(
                                                                  height: 300,
                                                                  width: 300,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .purple),
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        25.0),
                                                                  ),
                                                                  child: Container(
                                                                    margin:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                        2.0),
                                                                    width: 500.0,
                                                                    height: 800.0,
                                                                    child: Image.memory(
                                                                        _bytes),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: const Icon(
                                                    Icons.view_agenda_outlined)),
                                          ),
                                          SizedBox(
                                            child: IconButton(
                                                onPressed: () {

                                                  showDialog<void>(
                                                    context: context,
                                                    barrierDismissible:
                                                    false, // user must tap button!
                                                    builder: (BuildContext context) {
                                                      return AlertDialog(
                                                        title: const Text("Update Proof"),
                                                        content: SingleChildScrollView(
                                                          child: ListBody(
                                                            children: <Widget>[
                                                              TextFormField(
                                                                initialValue:
                                                                '${snapshot.data[index].proofPurpose}',
                                                                onChanged: (e) {
                                                                  setState(() {
                                                                    proofCode = e;
                                                                  });
                                                                },
                                                                decoration:
                                                                const InputDecoration(
                                                                    border:
                                                                    OutlineInputBorder(),
                                                                    labelText:
                                                                    "Proof Code"),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              TextFormField(
                                                                initialValue:
                                                                '${snapshot.data[index].proofID}',
                                                                onChanged: (e) {
                                                                  setState(() {
                                                                    proofId = e;
                                                                  });
                                                                },
                                                                decoration:
                                                                const InputDecoration(
                                                                    border:
                                                                    OutlineInputBorder(),
                                                                    labelText:
                                                                    "Proof Id"),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              TextFormField(
                                                                initialValue:
                                                                '${snapshot.data[index].proofName}',
                                                                onChanged: (e) {
                                                                  setState(() {
                                                                    proofName = e;
                                                                  });
                                                                },
                                                                decoration:
                                                                const InputDecoration(
                                                                    border:
                                                                    OutlineInputBorder(),
                                                                    labelText:
                                                                    "Proof Name"),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                margin:
                                                                const EdgeInsets.all(
                                                                    15.0),
                                                                padding:
                                                                const EdgeInsets.all(
                                                                    3.0),
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color:
                                                                        Colors.black),
                                                                    borderRadius:
                                                                    const BorderRadius.all(
                                                                        Radius
                                                                            .circular(
                                                                            5))),
                                                                child: Column(
                                                                  children: [
                                                                    if (image != null)
                                                                      Container(
                                                                        height: 100,
                                                                        width: 100,
                                                                        child: Image.file(
                                                                            File(image!
                                                                                .path)),
                                                                      ),
                                                                    RaisedButton(
                                                                      child: const Text(
                                                                          "Pick image"),
                                                                      onPressed:
                                                                          () async {
                                                                        image = await _picker
                                                                            .pickImage(
                                                                            source: ImageSource
                                                                                .gallery);
                                                                        setState(() {
                                                                          final bytes = File(
                                                                              image!
                                                                                  .path)
                                                                              .readAsBytesSync();
                                                                          String
                                                                          base64Image =
                                                                              "data:image/png;base64," +
                                                                                  base64Encode(
                                                                                      bytes);
                                                                          proof =
                                                                              base64Image;
                                                                        });
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            child: const Text('Back'),
                                                            onPressed: () {
                                                              Navigator.of(context).pop();
                                                            },
                                                          ),
                                                          TextButton(
                                                            child: const Text('Save'),
                                                            onPressed: () {
                                                              Navigator.pop(context);
                                                              serviceApi.updateProof(
                                                                  snapshot.data[index].id,
                                                                  Proof(
                                                                    proofPurpose:
                                                                    proofCode,
                                                                    proofID: proofId,
                                                                    proofName: proofName,
                                                                    proofFile: proof,
                                                                  ));
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ).then((_) => _refreshData());
                                                },
                                                icon:
                                                const Icon(Icons.edit_note_outlined)),
                                          ),
                                          IconButton(onPressed: (){
                                            serviceApi.deleteProof(snapshot.data[index].id);
                                            setState(() {
                                            });
                                            }, icon: Icon(Icons.delete))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    future: serviceApi.getProof(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
