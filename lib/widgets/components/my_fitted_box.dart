import 'package:flutter/material.dart';

Widget myFittedBox() {
  return Center(
      child: FittedBox(
    child: Row(
      children: <Widget>[
        Container(
          child: Image.asset('assets/images/splash.png'),
        ),
        Container(
          child: Text("This is a widget"),
        )
      ],
    ),
    fit: BoxFit.contain,
  ));
}
