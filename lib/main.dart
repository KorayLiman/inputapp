import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextFieldOperations(title: "MyApp"),
    );
  }
}

class TextFieldOperations extends StatelessWidget {
  const TextFieldOperations({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              autofocus: true,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              maxLength: 10,
              maxLines: 1,
              onChanged: (String str) => print(str),
              onSubmitted: (String str) => print(str),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  suffixIcon: Icon(Icons.supervised_user_circle),
                  prefixIcon: Icon(Icons.mail),
                  label: const Text(
                    "Username",
                  ),
                  hintText: "Enter hereee"),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
    );
  }
}
