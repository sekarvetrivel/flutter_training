import 'package:flutter/material.dart';

Widget myImage() {
  return Image.asset(
    'assets/images/image_1.jpg',
    width: 100,
    height: 200,
    fit: BoxFit.scaleDown,
  );
}
