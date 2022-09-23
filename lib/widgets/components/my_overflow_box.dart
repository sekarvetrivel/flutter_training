import 'package:flutter/material.dart';

Widget myOverflowBox() {
  return Center(
    child: Container(
      height: 50.0,
      width: 50.0,
      color: Colors.red,
      child: OverflowBox(
        minHeight: 70.0,
        minWidth: 70.0,
        child: Container(
          height: 50.0,
          width: 50.0,
          color: Colors.blue,
        ),
      ),
    ),
  );
}
