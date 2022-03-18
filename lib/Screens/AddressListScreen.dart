import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Screens/AddressRegistrationScreen.dart';

import '../Model/Address.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HttpService serviceapi = HttpService();
  String? to;
  String? al1;
  String? al2;
  String? cit;
  String? sta;
  String? count;
  String? pin;
  String? addtype;
  bool? present;
  bool isChecked = false;

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
                    "Address List",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const AddressRegistrationScreen()))
                            .then((_) => _refreshData());
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                      )),
                )),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshData,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FutureBuilder(
                    builder:
                        (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Name: ${snapshot.data[index].toAddress}"),
                                        SizedBox(
                                            width: 200,
                                            child: Text(
                                                "Address : ${snapshot.data[index].addressLine1} ${snapshot.data[index].addressLine2}")),
                                        Text(
                                            "City: ${snapshot.data[index].city} - ${snapshot.data[index].pincode}"),
                                        Text(
                                            "State: ${snapshot.data[index].state}"),
                                        Text(
                                            "Country: ${snapshot.data[index].country}"),
                                        Text(
                                            "Address Type: ${snapshot.data[index].addressType}"),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          showDialog<void>(
                                            context: context,
                                            barrierDismissible:
                                                false, // user must tap button!
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('AlertDialog Title'),
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: <Widget>[
                                                      SizedBox(height: 10),
                                                      TextFormField(
                                                        initialValue:
                                                            '${snapshot.data[index].toAddress}',
                                                        onChanged: (e) {
                                                          setState(() {
                                                            to = e;
                                                          });
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                          labelText: "To",
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),
                                                      TextFormField(
                                                        initialValue:
                                                            '${snapshot.data[index].addressLine1}',
                                                        onChanged: (e) {
                                                          setState(() {
                                                            al1 = e;
                                                          });
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                          labelText:
                                                              "Address Line 1",
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),
                                                      TextFormField(
                                                        initialValue:
                                                            '${snapshot.data[index].addressLine2}',
                                                        onChanged: (e) {
                                                          setState(() {
                                                            al2 = e;
                                                          });
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                          labelText:
                                                              "Address Line 2",
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),
                                                      TextFormField(
                                                        initialValue:
                                                            '${snapshot.data[index].city}',
                                                        onChanged: (e) {
                                                          setState(() {
                                                            cit = e;
                                                          });
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                          labelText: "City",
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),
                                                      TextFormField(
                                                        initialValue:
                                                            '${snapshot.data[index].state}',
                                                        onChanged: (e) {
                                                          setState(() {
                                                            sta = e;
                                                          });
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                          labelText: "State",
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),
                                                      TextFormField(
                                                        initialValue:
                                                            '${snapshot.data[index].country}',
                                                        onChanged: (e) {
                                                          setState(() {
                                                            count = e;
                                                          });
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                          labelText: "Country",
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),
                                                      TextFormField(
                                                        initialValue:
                                                            '${snapshot.data[index].pincode}',
                                                        onChanged: (e) {
                                                          setState(() {
                                                            pin = e;
                                                          });
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                          labelText: "Pincode",
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),
                                                      TextFormField(
                                                        initialValue:
                                                            '${snapshot.data[index].addressType}',
                                                        onChanged: (e) {
                                                          setState(() {
                                                            addtype = e;
                                                          });
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                          labelText:
                                                              "Address Type",
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),
                                                      // Checkbox(
                                                      //   checkColor: Colors.white,
                                                      //   value: isChecked,
                                                      //   onChanged: (bool? value) {
                                                      //     setState(() {
                                                      //       isChecked = value!;
                                                      //     });
                                                      //   },
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text('Cancel'),
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text('Save'),
                                                    onPressed: () {
                                                      Navigator.pop(context);

                                                      serviceapi.updateAddress(
                                                          snapshot.data[index].id,
                                                          Address(
                                                            toAddress: to,
                                                            addressLine1: al1,
                                                            addressLine2: al2,
                                                            city: cit,
                                                            state: sta,
                                                            country: count,
                                                            pincode: pin,
                                                            addressType: addtype,
                                                            isPresentAddress:
                                                                isChecked,
                                                          ));
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          ).then((_) => _refreshData());
                                        },
                                        icon: const Icon(Icons.edit)),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    future: serviceapi.getAddress(),
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
