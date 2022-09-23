import 'package:flutter/material.dart';

Widget myCenter() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Text(
          "VegElement",
        ),
        new Text("Non-vegElement"),
      ],
    ),
  );
}
