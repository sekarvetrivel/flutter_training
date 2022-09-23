import 'package:flutter/material.dart';

Widget mySizedBox() {
  return SizedBox(
    width: 100.0,
    height: 50.0,
    child: const Card(child: Text('This card in sizedbox!')),
  );
}
