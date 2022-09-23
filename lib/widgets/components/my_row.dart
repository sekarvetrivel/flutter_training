import 'package:flutter/material.dart';

Widget myRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      new Text(
        "VegElement",
      ),
      new Text("Non-vegElement"),
    ],
  );
}
