import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';

import '../Model/Address.dart';

class AddressRegistrationScreen extends StatefulWidget {
  const AddressRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<AddressRegistrationScreen> createState() =>
      _AddressRegistrationScreenState();
}

class _AddressRegistrationScreenState extends State<AddressRegistrationScreen> {
  HttpService serviceapi = HttpService();
  TextEditingController toAddress = TextEditingController();
  TextEditingController addressLine1 = TextEditingController();
  TextEditingController addressLine2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController addressType = TextEditingController();
  TextEditingController isPresentAddress = TextEditingController();
  bool isChecked = false;

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
                    "Add Address",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      serviceapi.createAddress(Address(
                        toAddress: toAddress.text,
                        addressLine1: addressLine1.text,
                        addressLine2: addressLine2.text,
                        city: city.text,
                        state: state.text,
                        country: country.text,
                        pincode: pincode.text,
                        addressType: addressType.text,
                        isPresentAddress: isChecked,
                      ));
                    },
                    icon: Icon(
                      Icons.done,
                      color: Colors.black,
                    ),
                  ),
                )),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: toAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: "To:"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Text";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: addressLine1,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: "Address Line 1"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Text";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: addressLine2,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: "Address Line 2 "),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Text";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: city,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: "City"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Text";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: state,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: "State"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Text";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: country,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: "Country"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Text";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: pincode,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: "Pincode"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Text";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        List<String> a = ["cannot load.."];
                        if (snapshot.hasData) {
                          a.clear();
                          a = snapshot.data;
                          return DropdownButtonFormField2(
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            isExpanded: true,
                            hint: const Text(
                              'Address type',
                              style: TextStyle(fontSize: 14),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 60,
                            buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
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
                              setState(() {
                                addressType.text = value.toString();
                              });
                            },
                            validator: (value) =>
                            value == null ? 'please select' : null,
                          );
                        }
                        return DropdownButtonFormField2(
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
                          buttonPadding:
                          const EdgeInsets.only(left: 20, right: 10),
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
                          validator: (value) =>
                          value == null ? 'please select' : null,
                        );
                      },
                      future: serviceapi.getParam('A0001'),
                    ),

                    // TextFormField(
                    //   //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    //   controller: addressType,
                    //   decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(15),
                    //       ),
                    //       labelText: "Address Type"),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return "Enter Text";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        const Text(" IsPresentaddress"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
