import 'package:flutter/material.dart';

Widget myAlign() {
  return Center(
    child: Container(
      height: 110.0,
      width: 110.0,
      color: Colors.blue,
      child: Align(
        alignment: Alignment.topLeft,
        child: FlutterLogo(
          size: 50,
        ),
      ),
    ),
  );
}
