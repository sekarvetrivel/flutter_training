import 'package:flutter/material.dart';

class MyStepper extends StatefulWidget {
  const MyStepper({Key? key}) : super(key: key);

  @override
  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: [
        Step(
          title: Text("Step 1"),
          content: Text("Step 1 Instructions"),
        ),
        Step(
          title: Text("Step 2"),
          content: Text("Step 2 Instructions"),
        ),
        Step(
          title: Text("Step 3"),
          content: Text("Step 3 Instructions"),
        ),
        Step(
          title: Text("Step 4"),
          content: Text("Step 4 Instructions"),
        ),
      ],
      onStepTapped: (int index) {
        setState(() {
          currentStep = index;
        });
      },
      onStepContinue: () {
        if (currentStep != 3) {
          setState(() {
            currentStep += 1;
          });
        }
      },
      onStepCancel: () {
        if (currentStep != 0) {
          setState(() {
            currentStep -= 1;
          });
        }
      },
      currentStep: currentStep,
    );
  }
}
