import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';

class ClientRegistrationScreen extends StatefulWidget {
  const ClientRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<ClientRegistrationScreen> createState() => _ClientRegistrationScreenState();
}

class _ClientRegistrationScreenState extends State<ClientRegistrationScreen> {

  HttpService api = HttpService();

  TextEditingController surName = TextEditingController();
  TextEditingController givenName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController birthPlace = TextEditingController();
  TextEditingController language = TextEditingController();
  TextEditingController category = TextEditingController();

  // DropDown
  // salutation
  // gender
  // maritial status
  // occupation
  // address
  // bankaccount

  //checkbox
  // company doctor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
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
              TextFormField(
                controller: givenName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Givenname"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: verbalAbility,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verbal Ability"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: verbalAbility,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verbal Ability"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: verbalAbility,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verbal Ability"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: verbalAbility,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verbal Ability"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: verbalAbility,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verbal Ability"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: verbalAbility,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verbal Ability"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: verbalAbility,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verbal Ability"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: verbalAbility,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verbal Ability"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: verbalAbility,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verbal Ability"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: verbalAbility,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verbal Ability"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: verbalAbility,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verbal Ability"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: verbalAbility,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verbal Ability"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: verbalAbility,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verbal Ability"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: verbalAbility,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verbal Ability"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: verbalAbility,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verbal Ability"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: verbalAbility,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verbal Ability"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: verbalAbility,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verbal Ability"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter some text';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
