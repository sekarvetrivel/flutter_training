import 'package:flutter/material.dart';

Widget myAspectRatio() {
  return AspectRatio(
    aspectRatio: 5/3,
    child: Container(
      color: Colors.blue,
      child: Center(child: Text("Aspect Ratio of 5/3"),),
    ),
  );
}
