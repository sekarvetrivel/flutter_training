import 'package:flutter/material.dart';

Widget myTextButton() {
  return TextButton(
    onPressed: () {},
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.green),
    ),
    child: Text(
      "Text Button",
    ),
  );
}