import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/Screens/AddressRegistrationScreen.dart';
import 'package:intl/intl.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Model/ClientData.dart';
import 'package:page_transition/page_transition.dart';

import '../Model/Address.dart';
import '../Model/Bank.dart';
import 'BankRegisterScreen.dart';

class ClientEdit extends StatefulWidget {
  int id;
  ClientEdit({Key? key, required this.id}) : super(key: key);

  @override
  State<ClientEdit> createState() =>
      _ClientEditState();
}

class _ClientEditState extends State<ClientEdit> {
  HttpService api = HttpService();

  final _formKey = GlobalKey<FormState>();

  Future<void> _refreshData() async {
    setState(() {});
  }


  bool? companyDoctor;
  var address,
      bank,
      birthDate,
      salutation,
      gender,
      marritalStatus,
      addressid,
      occupation,
      bankId,
      proofList,selectedBank,selectedAddress;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder(
          future: api.getClientbyId(widget.id),
          builder: (BuildContext context, AsyncSnapshot<ClientData> snapshot) {
            if(snapshot.hasData){
              ClientData? clientData = snapshot.data;

              selectedBank = clientData?.bankAccount?.accountHolderName;
              selectedAddress =clientData?.address?.toAddress;
              salutation = clientData?.salutation;
              gender = clientData?.gender;
              marritalStatus = clientData?.marritalStatus;
              occupation = clientData?.occupation;
              companyDoctor = clientData?.companyDoctor;

              TextEditingController surName = TextEditingController(text: clientData?.surName);
              TextEditingController givenName = TextEditingController(text: clientData?.givenName);
              TextEditingController mobileNumber = TextEditingController(text: clientData?.mobileNumber);
              TextEditingController postalCode = TextEditingController(text: clientData?.postalCode);
              TextEditingController country = TextEditingController(text: clientData?.country);
              TextEditingController nationality = TextEditingController(text: clientData?.nationality);
              TextEditingController birthPlace = TextEditingController(text: clientData?.birthPlace);
              TextEditingController language = TextEditingController(text: clientData?.language);
              TextEditingController category = TextEditingController(text: clientData?.category);
              TextEditingController datectl = TextEditingController(text: clientData?.birthDate);

              return Form(
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
                            "Edit Client",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pop(context);
                                api.updateClient(widget.id,ClientData(
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
                                                salutation = value.toString();
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
                                                gender = value.toString();
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
                                        marritalStatus = value.toString();
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
                                        occupation = value.toString();
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
                                // Row(
                                //   children: [
                                //     Checkbox(
                                //       checkColor: Theme.of(context).primaryColor,
                                //       value:companyDoctor,
                                //       onChanged: (value) {
                                //         setState(() {
                                //           companyDoctor = value;
                                //         });
                                //       },
                                //     ),
                                    // Checkbox(
                                    //   checkColor: Colors.white,
                                    //   value: companyDoctor,
                                    //   onChanged: (bool? value) {
                                    //     setState(() {
                                    //       companyDoctor = value;
                                    //     });
                                    //   },
                                    // ),
                                //     const Text("Company Doctor")
                                //   ],
                                // ),
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
                              initialValue: datectl.text,
                              type: DateTimePickerType.date,
                              dateMask: 'MM-dd-yyyy',
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                              icon: const Icon(Icons.event),
                              dateLabelText: 'Date',
                              timeLabelText: "Hour",
                              onChanged: (val) {
                                  datectl.text = DateFormat("MM-dd-yyyy")
                                      .format(DateTime.parse(val));
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
                              if (snapshot.hasData) {
                                List<Address> addressList = snapshot.data;
                                List<String> bankli = [];
                                List<int> indx = [];
                                for(var e in addressList){
                                  bankli.add(e.toAddress.toString());
                                  indx.add(int.parse(e.id.toString()));
                                }

                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 300,
                                      height: 70,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButtonFormField2(
                                          value: selectedAddress,
                                          isExpanded: true,
                                          hint: const Text(
                                            'Address',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black45,
                                          ),
                                          items: bankli
                                              .map((value) =>
                                              DropdownMenuItem(
                                                value: value,
                                                child: Text(
                                                  value.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                              .toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              selectedAddress = value.toString();
                                              int idx = bankli.indexOf(value.toString());
                                              address = indx[idx];
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
                                                      const AddressRegistrationScreen())).then((_) => _refreshData());
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
                              if (snapshot.hasData) {
                                List<BankAccount> bankList = snapshot.data;
                                List<int> indx = [];
                                List<String> bankli =[];
                                for(var e in bankList){
                                  bankli.add(e.accountHolderName.toString());
                                  indx.add(int.parse(e.id.toString()));
                                }
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 300,
                                      height: 70,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButtonFormField2(
                                          value: selectedBank,
                                          isExpanded: true,
                                          hint: const Text(
                                            'Bank',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black45,
                                          ),
                                          items: bankli
                                              .map((value) =>
                                              DropdownMenuItem(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                              .toList(),
                                          onChanged: (value) {
                                            selectedBank = value.toString();
                                            int idx = bankli.indexOf(value.toString());
                                            bank = indx[idx];
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
                                                      const BankRegistrationScreen())).then((_) => _refreshData());
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
              );
            }
            return Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}
