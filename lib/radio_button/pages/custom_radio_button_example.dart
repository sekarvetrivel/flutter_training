import 'package:flutter/material.dart';

class CustomRadioButtonExample extends StatefulWidget {
  const CustomRadioButtonExample({Key? key}) : super(key: key);

  @override
  State<CustomRadioButtonExample> createState() =>
      _CustomRadioButtonExampleState();
}

class _CustomRadioButtonExampleState extends State<CustomRadioButtonExample> {
  int value = 0;

  Widget CustomRadioButton(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          value = index;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: (value == index) ? Colors.green : Colors.black,
        ),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: BorderSide(color: (value == index) ? Colors.green : Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomRadioButton("Single", 1),
        CustomRadioButton("Married", 2),
        CustomRadioButton("Other", 3)
      ],
    );
  }
}
