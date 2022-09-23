import 'package:flutter/material.dart';

Widget myStack() {
  return Center(
    child: Stack(
      children: <Widget>[
        new Text(
          "VegElement",
        ),
        new Text("Non-vegElement"),
      ],
    ),
  );
}
