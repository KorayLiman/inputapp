import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateAndTimeExample extends StatefulWidget {
  const DateAndTimeExample({Key? key}) : super(key: key);

  @override
  _DateAndTimeExampleState createState() => _DateAndTimeExampleState();
}

class _DateAndTimeExampleState extends State<DateAndTimeExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DateTime"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  showDatePicker(
                          helpText: "Tarih Seciniz",
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().month - 3),
                          lastDate: DateTime(2022, DateTime.now().month + 3))
                      .then((date) => print(date));
                },
                child: const Text("Choose Date")),
            ElevatedButton(
                onPressed: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then((value) => print(value));
                },
                child: const Text("Choose Time"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}
