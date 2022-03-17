import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:insuranceprototype/Screens/AddressRegistrationScreen.dart';
import 'package:intl/intl.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Model/ClientData.dart';
import 'package:page_transition/page_transition.dart';

import '../Model/Address.dart';
import '../Model/Bank.dart';
import 'BankRegisterScreen.dart';

class ClientRegistrationScreen extends StatefulWidget {
  const ClientRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<ClientRegistrationScreen> createState() =>
      _ClientRegistrationScreenState();
}

class _ClientRegistrationScreenState extends State<ClientRegistrationScreen> {
  HttpService api = HttpService();
  bool companyDoctor = false;
  var address,
      bank,
      birthDate,
      salutation,
      gender,
      marritalStatus,
      addressid,
      occupation,
      bankId,
      proofList;

  TextEditingController surName = TextEditingController();
  TextEditingController givenName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController birthPlace = TextEditingController();
  TextEditingController language = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController datectl = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _refreshData() async {
    setState(() {});
  }

  Address selectedAD = Address();

  int indexofadd = 0;

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

    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: _formKey,
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
                        "Client Registration",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pop(context);
                            api.createClient(ClientData(
                              surName: surName.text,
                              givenName: givenName.text,
                              salutation: salutation,
                              gender: gender,
                              marritalStatus: marritalStatus,
                              addressid: address,
                              mobileNumber: mobileNumber.text,
                              postalCode: postalCode.text,
                              country: country.text,
                              nationality: nationality.text,
                              companyDoctor: companyDoctor,
                              birthDate: datectl.text,
                              birthPlace: birthPlace.text,
                              language: language.text,
                              category: category.text,
                              occupation: occupation,
                              bankId: bank,
                              proofList: proofList,
                            ));
                          }
                        },
                        icon: const Icon(Icons.done),
                      ),
                    )),
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          FutureBuilder(
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              List<String> a = ["cannot load.."];
                              if (snapshot.hasData) {
                                a.clear();
                                a = snapshot.data;
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: SizedBox(
                                    width: 140,
                                    height: 70,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownButtonFormField2(
                                        value: salutation,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.zero,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        items: a
                                            .map((item) =>
                                                DropdownMenuItem<String>(
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
                                            salutation = value;
                                          });
                                        },
                                        onSaved: (value) {
                                          setState(() {
                                            salutation = value;
                                          });
                                        },
                                        validator: (value) => value == null
                                            ? 'please select'
                                            : null,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: SizedBox(
                                  width: 140,
                                  height: 70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField2(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.zero,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (value) {},
                                      onSaved: (value) {},
                                      validator: (value) => value == null
                                          ? 'please select'
                                          : null,
                                    ),
                                  ),
                                ),
                              );
                            },
                            future: api.getParam('G0002'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: SizedBox(
                              width: 250,
                              child: TextFormField(
                                controller: surName,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    labelText: "Surname"),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'enter your surname';
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
                              List<String> a = ["cannot load.."];
                              if (snapshot.hasData) {
                                a.clear();
                                a = snapshot.data;
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: SizedBox(
                                    width: 140,
                                    height: 70,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownButtonFormField2(
                                        value: gender,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.zero,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        items: a
                                            .map((item) =>
                                                DropdownMenuItem<String>(
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
                                            gender = value;
                                          });
                                        },
                                        onSaved: (value) {
                                          setState(() {
                                            gender = value;
                                          });
                                        },
                                        validator: (value) => value == null
                                            ? 'please select'
                                            : null,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: SizedBox(
                                  width: 140,
                                  height: 70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField2(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.zero,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (value) {},
                                      onSaved: (value) {},
                                      validator: (value) => value == null
                                          ? 'please select'
                                          : null,
                                    ),
                                  ),
                                ),
                              );
                            },
                            future: api.getParam('G0001'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: SizedBox(
                              width: 250,
                              child: TextFormField(
                                controller: givenName,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    labelText: "Givenname"),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'enter your givenname';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: FutureBuilder(
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            List<String> a = ["cannot load.."];
                            if (snapshot.hasData) {
                              a.clear();
                              a = snapshot.data;
                              return DropdownButtonFormField2(
                                value: marritalStatus,
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
                                    marritalStatus = value;
                                  });
                                },
                                onSaved: (value) {
                                  setState(() {
                                    marritalStatus = value;
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
                                'maritial status',
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
                              onChanged: (value) {},
                              onSaved: (value) {},
                              validator: (value) =>
                                  value == null ? 'please select' : null,
                            );
                          },
                          future: api.getParam('R0001'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: FutureBuilder(
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            List<String> a = ["cannot load.."];
                            if (snapshot.hasData) {
                              a.clear();
                              a = snapshot.data;
                              return DropdownButtonFormField2(
                                value: occupation,
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
                                  setState(() {
                                    occupation = value;
                                  });
                                },
                                onSaved: (value) {
                                  occupation = value;
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
                              onChanged: (value) {},
                              onSaved: (value) {},
                              validator: (value) =>
                                  value == null ? 'please select' : null,
                            );
                          },
                          future: api.getParam('W0001'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: TextFormField(
                          controller: mobileNumber,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: "Mobilenumber"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enter your mobile number';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: Row(
                          children: [
                            Container(
                              width: 200,
                              child: TextFormField(
                                controller: postalCode,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    labelText: "Postalcode"),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'enter your postalcode';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: companyDoctor,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      companyDoctor = value!;
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
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: "Country"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enter your country';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: TextFormField(
                          controller: nationality,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: "Nationality"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enter your nationality';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: DateTimePicker(
                          type: DateTimePickerType.date,
                          dateMask: 'dd-MM-yyyy',
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          icon: const Icon(Icons.event),
                          dateLabelText: 'Date',
                          timeLabelText: "Hour",
                          onChanged: (val) {
                            setState(() {
                              datectl.text = DateFormat("MM-dd-yyyy")
                                  .format(DateTime.parse(val));
                            });
                          },
                          onSaved: (val) {
                            setState(() {
                              datectl.text = DateFormat("MM-dd-yyyy")
                                  .format(DateTime.parse(val!));
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: TextFormField(
                          controller: birthPlace,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: "Birthplace"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enter your birthplace';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: TextFormField(
                          controller: language,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: "language"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enter your language';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: TextFormField(
                          controller: category,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: "Category"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'cannot be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      FutureBuilder(
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          List<Address> addressList = [];
                          if (snapshot.hasData) {
                            addressList.clear();
                            addressList = snapshot.data;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 300,
                                  height: 70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField2(
                                      value: addressList.isEmpty
                                          ? "empty"
                                          : addressList[indexofadd],
                                      isExpanded: true,
                                      hint: const Text(
                                        'Address',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black45,
                                      ),
                                      items: addressList
                                          .map((Address value) =>
                                              DropdownMenuItem<Address>(
                                                value: value,
                                                child: Text(
                                                  value.toAddress.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        Address addresspre = value as Address;
                                        setState(() {
                                          indexofadd =
                                              addressList.indexOf(value);
                                          address = addresspre.id;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffbe61565),
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  type: PageTransitionType
                                                      .leftToRight,
                                                  child:
                                                      const AddressRegistrationScreen()));
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        )))
                              ],
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        future: api.getAddress(),
                      ),
                      FutureBuilder(
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          List<BankAccount> bankList = [];
                          if (snapshot.hasData) {
                            bankList.clear();
                            bankList = snapshot.data;
                            int indexofbank = 0;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 300,
                                  height: 70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField2(
                                      value: bankList.isNotEmpty ?bankList[indexofbank] : "cannot load",
                                      isExpanded: true,
                                      hint: const Text(
                                        'Bank',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black45,
                                      ),
                                      items: bankList
                                          .map((BankAccount value) =>
                                              DropdownMenuItem<BankAccount>(
                                                value: value,
                                                child: Text(
                                                  value.accountHolderName
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        BankAccount addresspre =
                                            value as BankAccount;
                                        setState(() {
                                          indexofbank = bankList.indexOf(value);
                                          bank = addresspre.id;
                                        });
                                      },
                                      onSaved: (value) {
                                        BankAccount addresspre =
                                            value as BankAccount;
                                        setState(() {
                                          indexofbank = bankList.indexOf(value);
                                          address = addresspre.id;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffbe61565),
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  type: PageTransitionType
                                                      .leftToRight,
                                                  child:
                                                      const BankRegistrationScreen()));
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        )))
                              ],
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        future: api.getBank(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
