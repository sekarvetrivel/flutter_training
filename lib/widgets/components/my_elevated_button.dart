import 'package:flutter/material.dart';

Widget myElevatedButton() {
  return ElevatedButton(
    onPressed: () {},
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(4.0),
      backgroundColor: MaterialStateProperty.all(Colors.blue),
      overlayColor: MaterialStateProperty.all(Colors.yellow),
    ),
    child: Text(
      "Elevated Button",
    ),
  );
}