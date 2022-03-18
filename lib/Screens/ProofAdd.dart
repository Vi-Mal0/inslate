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

  // var local_images;
  // PickedFile? file;
  // var path;
  // Future getImageFromGallery() async {
  //   var image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     file = image;
  //
  //     // String p = "${image?.path}";
  //     // path = basename(p);
  //     //
  //     // final encode = base64Encode(file?.readAsBytes());
  //     // local_images = "data:image/jpeg;base64,$encode";
  //   });
  // }

  final ImagePicker _picker = ImagePicker();
  XFile? image;

  HttpService serviceApi = HttpService();
  TextEditingController controller = TextEditingController();
  TextEditingController proofCode = TextEditingController();
  TextEditingController proofId = TextEditingController();
  TextEditingController proofName = TextEditingController();
  TextEditingController proof = TextEditingController();

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
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: Column(
                      children: [
                        if(image != null) Container(
                          height: 100,
                          width: 100,
                          child: Image.file(File(image!.path)),
                        ),
                        RaisedButton(child: const Text("Pick image"), onPressed: () async {   image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {

                          final bytes = File(image!.path).readAsBytesSync();
                          String base64Image =  "data:image/png;base64,"+base64Encode(bytes);
                          proof.text = base64Image;
                        }); },),

                      ],
                    ),
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




// GestureDetector(
//   onTap: () {
//     getImageFromGallery();
//   },
//   child: Container(
//     height: 400,
//     width: MediaQuery.of(context).size.width/2 * 1.9,
//     decoration: BoxDecoration(
//       border: Border.all(
//           color: Colors.purple,
//           width: 2
//       ),
//       // borderRadius: BorderRadius.circular(25.0),
//     ), //             <--- BoxDecoration here
//     child: local_images == null
//         ? Row(
//       children: const [
//         Icon(Icons.image),
//         Text("Click to select image")
//       ],
//       mainAxisAlignment: MainAxisAlignment.center,
//     )
//         : Image.file(
//       local_images,
//       width: MediaQuery.of(context).size.width/2 * 1.5,
//       fit: BoxFit.cover,
//     ),
//   ),
// ),


// TextFormField(
//   controller: proof,
//   decoration: InputDecoration(
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       labelText: "Proof File"),
// ),
