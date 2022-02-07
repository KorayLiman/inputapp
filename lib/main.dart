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

class TextFieldOperations extends StatefulWidget {
  const TextFieldOperations({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TextFieldOperations> createState() => _TextFieldOperationsState();
}

class _TextFieldOperationsState extends State<TextFieldOperations> {
  late TextEditingController _emailController;
  late FocusNode _MyFocusNode;
  int maxLine = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController(text: "kliman@gmail.com");
    _MyFocusNode = FocusNode();
    _MyFocusNode.addListener(() {
      setState(() {
        if (_MyFocusNode.hasFocus) {
          maxLine = 3;
        } else {
          maxLine = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _MyFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              focusNode: _MyFocusNode,
              controller: _emailController,
              autofocus: true,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              maxLength: 10,
              maxLines: maxLine,
              onChanged: (String str) => setState(() {
                _emailController.value = TextEditingValue(
                    text: str,
                    selection: TextSelection.collapsed(offset: str.length));
              }),
              onSubmitted: (String str) => print(str),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  suffixIcon: Icon(Icons.supervised_user_circle),
                  prefixIcon: Icon(Icons.login),
                  label: const Text(
                    "Username",
                  ),
                  hintText: "Enter hereee"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_emailController.text),
          ),
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
                  suffixIcon: Icon(Icons.password),
                  prefixIcon: Icon(Icons.login),
                  label: const Text(
                    "Password",
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
