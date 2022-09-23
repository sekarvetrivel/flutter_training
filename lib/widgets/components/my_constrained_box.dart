import 'package:flutter/material.dart';

Widget myConstrainedBox() {
  return ConstrainedBox(
    constraints: new BoxConstraints(
      minHeight: 150.0,
      minWidth: 150.0,
      maxHeight: 300.0,
      maxWidth: 300.0,
    ),
    child: new DecoratedBox(
      decoration: new BoxDecoration(color: Colors.red),
    ),
  );
}
