import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFieldUsage extends StatefulWidget {
  const TextFormFieldUsage({Key? key}) : super(key: key);

  @override
  _TextFormFieldUsageState createState() => _TextFormFieldUsageState();
}

class _TextFormFieldUsageState extends State<TextFormFieldUsage> {
  String _email = "", _password = "", _userName = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("TextFormField")),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(children: [
                TextFormField(
                  validator: (input) {
                    if (input!.length < 4) {
                      return "length < 4";
                    } else {
                      return null;
                    }
                  },
                  initialValue: "initial val",
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14)),
                      hintText: "username",
                      label: Text("Label Text",
                          style: TextStyle(color: Colors.blue))),
                  onSaved: (value) {
                    _userName = value!;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    onSaved: (value) {
                      _email = value!;
                    },
                    validator: (input) {
                      // if (input!.length < 4) {
                      //   return "length < 4";
                      // } else {
                      //   return null;
                      // }
                      if (!EmailValidator.validate(input!)) {
                        return "invalid mail";
                      } else {
                        return null;
                      }
                    },
                    initialValue: "initial val email",
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14)),
                        hintText: "email",
                        label: Text("Label Text",
                            style: TextStyle(color: Colors.blue))),
                  ),
                ),
                TextFormField(
                  onSaved: (value) {
                    _password = value!;
                  },
                  validator: (input) {
                    if (input!.length < 4) {
                      return "length < 4";
                    } else {
                      return null;
                    }
                  },
                  initialValue: "initial val",
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14)),
                      hintText: "password",
                      label: Text("Label Text",
                          style: TextStyle(color: Colors.blue))),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        String result =
                            "username: $_userName email: $_email password: $_password";
                        print(result);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(result)));
                        _formKey.currentState!.reset();
                      }
                    },
                    child: const Text("Confirm"))
              ]),
            ),
          )),
        ));
  }
}
