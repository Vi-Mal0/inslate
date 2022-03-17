import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../HTTP/HttpService.dart';

class ClientEdit extends StatefulWidget {
  int id;
  ClientEdit({Key? key, required this.id}) : super(key: key);

  @override
  State<ClientEdit> createState() => _ClientEditState();
}

class _ClientEditState extends State<ClientEdit> {
  HttpService api = HttpService();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Scaffold(
        body: FutureBuilder(
      future: api.getClientbyId(widget.id),
      builder: (BuildContext context, AsyncSnapshot<dynamic> apival) {
        if (apival.hasData) {
          TextEditingController surName =
              TextEditingController(text: apival.data.surName);
          TextEditingController givenName =
              TextEditingController(text: apival.data.givenName);
          TextEditingController mobileNumber =
              TextEditingController(text: apival.data.mobileNumber);
          TextEditingController postalCode =
              TextEditingController(text: apival.data.postalCode);
          TextEditingController country =
              TextEditingController(text: apival.data.country);
          TextEditingController nationality =
              TextEditingController(text: apival.data.nationality);
          TextEditingController birthPlace =
              TextEditingController(text: apival.data.birthPlace);
          TextEditingController language =
              TextEditingController(text: apival.data.language);
          TextEditingController category =
              TextEditingController(text: apival.data.category);
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    FutureBuilder(
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          List<String> a = snapshot.data;
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: SizedBox(
                              width: 150,
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButtonFormField2(
                                  value: apival.data.salutation,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  isExpanded: true,
                                  hint: const Text(
                                    'Salutation',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black45,
                                  ),
                                  iconSize: 30,
                                  buttonHeight: 60,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 20, right: 10),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  items: a
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                      future: api.getParam('G0002'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: SizedBox(
                        width: 250,
                        child: TextFormField(
                          controller: surName,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Surname"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'cannot be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    FutureBuilder(
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          List<String> a = snapshot.data;
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: SizedBox(
                              width: 150,
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButtonFormField2(
                                  value: apival.data.gender,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  isExpanded: true,
                                  hint: const Text(
                                    'gender',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black45,
                                  ),
                                  iconSize: 30,
                                  buttonHeight: 60,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 20, right: 10),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  items: a
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                      future: api.getParam('G0001'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: SizedBox(
                        width: 250,
                        child: TextFormField(
                          controller: givenName,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Givenname"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'cannot be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    FutureBuilder(
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        print(snapshot.hasData);
                        if (snapshot.hasData) {
                          List<String> a = snapshot.data;
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: SizedBox(
                              width: 200,
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButtonFormField2(
                                  value: apival.data.marritalStatus,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  isExpanded: true,
                                  hint: const Text(
                                    'maritial status',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black45,
                                  ),
                                  iconSize: 30,
                                  buttonHeight: 60,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 20, right: 10),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  items: a
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                      future: api.getParam('R0001'),
                    ),
                    FutureBuilder(
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          List<String> a = snapshot.data;
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: SizedBox(
                              width: 200,
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButtonFormField2(
                                  value: apival.data.occupation,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  isExpanded: true,
                                  hint: const Text(
                                    'occupation',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black45,
                                  ),
                                  iconSize: 30,
                                  buttonHeight: 60,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 20, right: 10),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  items: a
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                      future: api.getParam('W0001'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: TextFormField(
                    controller: mobileNumber,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Mobilenumber"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'cannot be empty';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          controller: postalCode,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Postalcode"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'cannot be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          const Text("Company Doctor")
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: TextFormField(
                    controller: country,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Country"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'cannot be empty';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: TextFormField(
                    controller: nationality,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Nationality"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'cannot be empty';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: TextFormField(
                    controller: birthPlace,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Birthplace"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'cannot be empty';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: TextFormField(
                    controller: language,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "language"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'cannot be empty';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: TextFormField(
                    controller: category,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Category"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'cannot be empty';
                      }
                      return null;
                    },
                  ),
                ),
                // FutureBuilder(
                //   builder:
                //       (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                //     if (snapshot.hasData) {
                //       List<String> a = snapshot.data;
                //       return Padding(
                //         padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                //           children: [
                //             SizedBox(
                //               width: 300,
                //               height: 70,
                //               child: Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: DropdownButtonFormField2(
                //                   decoration: InputDecoration(
                //                     isDense: true,
                //                     contentPadding: EdgeInsets.zero,
                //                     border: OutlineInputBorder(
                //                       borderRadius: BorderRadius.circular(15),
                //                     ),
                //                   ),
                //                   isExpanded: true,
                //                   hint: const Text(
                //                     'address type',
                //                     style: TextStyle(fontSize: 14),
                //                   ),
                //                   icon: const Icon(
                //                     Icons.arrow_drop_down,
                //                     color: Colors.black45,
                //                   ),
                //                   iconSize: 30,
                //                   buttonHeight: 60,
                //                   buttonPadding:
                //                       const EdgeInsets.only(left: 20, right: 10),
                //                   dropdownDecoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(15),
                //                   ),
                //                   items: a
                //                       .map((item) => DropdownMenuItem<String>(
                //                             value: item,
                //                             child: Text(
                //                               item,
                //                               style: const TextStyle(
                //                                 fontSize: 14,
                //                               ),
                //                             ),
                //                           ))
                //                       .toList(),
                //                   onChanged: (value) {
                //                     setState(() {
                //                       result = value.toString();
                //                     });
                //                   },
                //                 ),
                //               ),
                //             ),
                //             Container(
                //                 decoration: BoxDecoration(
                //                     color: Colors.amber,
                //                     border: Border.all(
                //                       color: Colors.black,
                //                     ),
                //                     borderRadius:
                //                         BorderRadius.all(Radius.circular(20))),
                //                 child: IconButton(
                //                     onPressed: () {
                //                       Navigator.pop(context, true);
                //                     },
                //                     icon: const Icon(Icons.done)))
                //           ],
                //         ),
                //       );
                //     }
                //     return const CircularProgressIndicator();
                //   },
                //   future: api.getParam('AT001'),
                // ),
                // FutureBuilder(
                //   builder:
                //       (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                //     if (snapshot.hasData) {
                //       List<String> a = snapshot.data;
                //       return Padding(
                //         padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                //           children: [
                //             SizedBox(
                //               width: 300,
                //               height: 70,
                //               child: Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: DropdownButtonFormField2(
                //                   decoration: InputDecoration(
                //                     isDense: true,
                //                     contentPadding: EdgeInsets.zero,
                //                     border: OutlineInputBorder(
                //                       borderRadius: BorderRadius.circular(15),
                //                     ),
                //                   ),
                //                   isExpanded: true,
                //                   hint: const Text(
                //                     'bankaccount type',
                //                     style: TextStyle(fontSize: 14),
                //                   ),
                //                   icon: const Icon(
                //                     Icons.arrow_drop_down,
                //                     color: Colors.black45,
                //                   ),
                //                   iconSize: 30,
                //                   buttonHeight: 60,
                //                   buttonPadding:
                //                       const EdgeInsets.only(left: 20, right: 10),
                //                   dropdownDecoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(15),
                //                   ),
                //                   items: a
                //                       .map((item) => DropdownMenuItem<String>(
                //                             value: item,
                //                             child: Text(
                //                               item,
                //                               style: const TextStyle(
                //                                 fontSize: 14,
                //                               ),
                //                             ),
                //                           ))
                //                       .toList(),
                //                   onChanged: (value) {
                //                     setState(() {
                //                       result = value.toString();
                //                     });
                //                   },
                //                 ),
                //               ),
                //             ),
                //             Container(
                //                 decoration: BoxDecoration(
                //                     color: Colors.amber,
                //                     border: Border.all(
                //                       color: Colors.black,
                //                     ),
                //                     borderRadius:
                //                         BorderRadius.all(Radius.circular(20))),
                //                 child: IconButton(
                //                     onPressed: () {
                //                       Navigator.pop(context, true);
                //                     },
                //                     icon: const Icon(Icons.done)))
                //           ],
                //         ),
                //       );
                //     }
                //     return const CircularProgressIndicator();
                //   },
                //   future: api.getParam('S002'),
                // ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 70,
                      width: 300,
                      child: const Card(
                        color: Color(0xffbe61565),
                        child: Center(
                            child: Text(
                          "update",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
