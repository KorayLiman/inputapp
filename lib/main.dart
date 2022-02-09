import 'package:flutter/material.dart';

import 'textformfieldusage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final counterWidgetKey = GlobalKey<_CounterwidgetState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "InputApp",
        theme: ThemeData(primarySwatch: Colors.green),
        home: CheckboxSliderRatio());
  }
}

class CheckboxSliderRatio extends StatefulWidget {
  CheckboxSliderRatio({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckboxSliderRatio> createState() => _CheckboxSliderRatioState();
}

class _CheckboxSliderRatioState extends State<CheckboxSliderRatio> {
  bool CheckBoxState = false;
  String city = "";
  bool isSwitched = false;
  double sliderValue = 0;
  String? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Checkbox, slider, radio")),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                CheckboxListTile(
                  value: CheckBoxState,
                  onChanged: (isChecked) {
                    setState(() {
                      CheckBoxState = isChecked!;
                    });
                  },
                  activeColor: Colors.blue,
                  title: const Text("Title"),
                  subtitle: const Text("SubTitle"),
                  secondary: Icon(Icons.check),
                ),
                RadioListTile<String>(
                    title: const Text("Sivas"),
                    value: "Sivas",
                    groupValue: city,
                    onChanged: (val) {
                      setState(() {
                        city = val!;
                      });
                      print(val);
                    }),
                RadioListTile<String>(
                    title: const Text("Ankara"),
                    value: "Ankara",
                    groupValue: city,
                    onChanged: (val) {
                      setState(() {
                        city = val!;
                      });
                      print(val);
                    }),
                RadioListTile<String>(
                    secondary: Icon(Icons.check),
                    title: const Text("Bursa"),
                    value: "Bursa",
                    groupValue: city,
                    onChanged: (val) {
                      setState(() {
                        city = val!;
                      });
                      print(val);
                    }),
                SwitchListTile(
                    value: isSwitched,
                    onChanged: (val) {
                      setState(() {
                        isSwitched = val;
                      });
                    },
                    title: const Text("Switch"),
                    secondary: Icon(Icons.wifi)),
                Slider(
                    min: 0,
                    max: 10,
                    divisions: 10,
                    label: sliderValue.toString(),
                    value: sliderValue,
                    onChanged: (val) {
                      sliderValue = val;
                    }),
                DropdownButton<String>(
                  hint: const Text("Choose"),
                  value: selectedColor,
                  items: [
                    DropdownMenuItem<String>(
                        child: Row(
                          children: [
                            Icon(Icons.slideshow),
                            const Text(
                              "Red",
                            ),
                          ],
                        ),
                        value: "Red"),
                    DropdownMenuItem<String>(
                        child: const Text("Blue"), value: "Blue"),
                    DropdownMenuItem<String>(
                        child: const Text("Yellow"), value: "Yellow"),
                  ],
                  onChanged: (String? selected) {
                    setState(() {
                      if (selected != null) selectedColor = selected;
                    });
                  },
                )
              ],
            ))

        // body: Center(
        //     child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //       Text("Presed this many times"),
        //       Counterwidget(key: counterWidgetKey)
        //     ])),
        // floatingActionButton: FloatingActionButton(
        //     onPressed: () {
        //       counterWidgetKey.currentState!.increment();
        //     },
        //     child: Icon(Icons.add)),
        );
  }
}

class Counterwidget extends StatefulWidget {
  Counterwidget({Key? key}) : super(key: key);

  @override
  _CounterwidgetState createState() => _CounterwidgetState();
}

class _CounterwidgetState extends State<Counterwidget> {
  int _counter = 0;
  void increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_counter.toString());
  }
}
