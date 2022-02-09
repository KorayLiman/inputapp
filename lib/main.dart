import 'package:flutter/material.dart';
import 'package:inputapp/dateandtime.dart';

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
        //appBar: AppBar(title: const Text("Stepper")),
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/secret-wave@1000x1000px.jpg",
                      ),
                      fit: BoxFit.fill))),
          StepperExample()
        ],
      ),
    )
        //
        //
        //
        // Padding(
        //     padding: const EdgeInsets.all(20),
        //     child: ListView(
        //       children: [
        //         CheckboxListTile(
        //           value: CheckBoxState,
        //           onChanged: (isChecked) {
        //             setState(() {
        //               CheckBoxState = isChecked!;
        //             });
        //           },
        //           activeColor: Colors.blue,
        //           title: const Text("Title"),
        //           subtitle: const Text("SubTitle"),
        //           secondary: Icon(Icons.check),
        //         ),
        //         RadioListTile<String>(
        //             title: const Text("Sivas"),
        //             value: "Sivas",
        //             groupValue: city,
        //             onChanged: (val) {
        //               setState(() {
        //                 city = val!;
        //               });
        //               print(val);
        //             }),
        //         RadioListTile<String>(
        //             title: const Text("Ankara"),
        //             value: "Ankara",
        //             groupValue: city,
        //             onChanged: (val) {
        //               setState(() {
        //                 city = val!;
        //               });
        //               print(val);
        //             }),
        //         RadioListTile<String>(
        //             secondary: Icon(Icons.check),
        //             title: const Text("Bursa"),
        //             value: "Bursa",
        //             groupValue: city,
        //             onChanged: (val) {
        //               setState(() {
        //                 city = val!;
        //               });
        //               print(val);
        //             }),
        //         SwitchListTile(
        //             value: isSwitched,
        //             onChanged: (val) {
        //               setState(() {
        //                 isSwitched = val;
        //               });
        //             },
        //             title: const Text("Switch"),
        //             secondary: Icon(Icons.wifi)),
        //         Slider(
        //             min: 0,
        //             max: 10,
        //             divisions: 10,
        //             label: sliderValue.toString(),
        //             value: sliderValue,
        //             onChanged: (val) {
        //               sliderValue = val;
        //             }),
        //         DropdownButton<String>(
        //           hint: const Text("Choose"),
        //           value: selectedColor,
        //           items: [
        //             DropdownMenuItem<String>(
        //                 child: Row(
        //                   children: [
        //                     Icon(Icons.slideshow),
        //                     const Text(
        //                       "Red",
        //                     ),
        //                   ],
        //                 ),
        //                 value: "Red"),
        //             DropdownMenuItem<String>(
        //                 child: const Text("Blue"), value: "Blue"),
        //             DropdownMenuItem<String>(
        //                 child: const Text("Yellow"), value: "Yellow"),
        //           ],
        //           onChanged: (String? selected) {
        //             setState(() {
        //               if (selected != null) selectedColor = selected;
        //             });
        //           },
        //         )
        //       ],
        //     ))

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

class StepperExample extends StatefulWidget {
  const StepperExample({Key? key}) : super(key: key);

  @override
  _StepperExampleState createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _activeStep = 0;
  String name = "", mail = "", password = "";
  bool error = false;

  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Stepper(
      controlsBuilder: (context, details) {
        return Row(
          children: [
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    side: BorderSide(width: 2, color: Colors.white)),
                onPressed: details.onStepContinue,
                child: const Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              width: 15,
            ),
            OutlinedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: details.onStepCancel,
                child: const Text("Cancel"))
          ],
        );
      },
      currentStep: _activeStep,
      // onStepTapped: (clickedstep) {
      //   setState(() {
      //     _activeStep = clickedstep;
      //   });
      // },
      onStepContinue: () {
        setState(() {
          checkForContinue();
        });
      },
      onStepCancel: () {
        if (_activeStep != 0) {
          setState(() {
            _activeStep--;
          });
        }
      },
      steps: _AllSteps(),
    );
  }

  List<Step> _AllSteps() {
    List<Step> steps = [
      Step(
        title: const Text(
          "Name",
          style: TextStyle(color: Colors.white),
        ),
        subtitle: const Text("Subtitle", style: TextStyle(color: Colors.white)),
        state: SetStates(0),
        isActive: true,
        content: TextFormField(
            key: key0,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.white),
                labelText: "Name",
                hintText: "Name Hint",
                hintStyle: TextStyle(color: Colors.white),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
            validator: (str) {
              if (str!.length < 4) {
                return "Length < 4";
              }
            },
            onSaved: (str) {
              name = str!;
            }),
      ),
      Step(
        title: const Text("Mail"),
        subtitle: const Text("Subtitle"),
        state: SetStates(1),
        isActive: true,
        content: TextFormField(
          key: key1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              labelText: "Mail",
              hintText: "Mail Hint",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          validator: (str) {
            if (str!.length < 4 || !str.contains("@")) {
              return "Length < 4";
            }
          },
          onSaved: (str) {
            mail = str!;
          },
        ),
      ),
    ];
    return steps;
  }

  StepState SetStates(int index) {
    if (_activeStep == index) {
      if (error) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else {
      return StepState.complete;
    }
    //return StepState.complete;
  }

  void checkForContinue() {
    switch (_activeStep) {
      case 0:
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          error = false;
          _activeStep++;
        } else {
          error = true;
        }
        break;
      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          error = false;
          formCompleted();
        } else {
          error = true;
        }
        break;
    }
  }

  void formCompleted() {
    print("name $name  mail: $mail");
  }
}
