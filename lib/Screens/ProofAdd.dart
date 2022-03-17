import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../HTTP/HttpService.dart';
import '../Model/Proof.dart';

class ProofAdd extends StatefulWidget {
  int id;
  ProofAdd({Key? key, required this.id}) : super(key: key);

  @override
  State<ProofAdd> createState() => _ProofAddState();
}

class _ProofAddState extends State<ProofAdd> {
  HttpService serviceApi = HttpService();
  TextEditingController controller = TextEditingController();
  TextEditingController proofCode = TextEditingController();
  TextEditingController proofId = TextEditingController();
  TextEditingController proofName = TextEditingController();
  TextEditingController proof = TextEditingController();

  String images = "";
  File? local_images;
  ImagePicker imagePicker = ImagePicker();

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      local_images = image;

      images = basename(image.path);

      final encode = base64Encode(local_images!.readAsBytesSync());
      images = "data:image/jpeg;base64,$encode";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: 50,
                child: ListTile(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                    ),
                  ),
                  title: const Text("Add proof"),
                  trailing: IconButton(
                    icon: Icon(Icons.done),
                    onPressed: (){
                      Navigator.pop(context);
                      serviceApi.createProof(Proof(
                        clientID: widget.id,
                        proofPurpose: proofCode.text,
                        proofID: proofId.text,
                        proofName: proofName.text,
                        proofFile: proof.text,
                      ));
                    },
                  ),
                )),
            const Divider(
              color: Colors.black38,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  TextFormField(
                    controller: proofCode,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Proof Purpose"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: proofId,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Proof Id"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: proofName,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Proof Name"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: proof,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Proof File"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
