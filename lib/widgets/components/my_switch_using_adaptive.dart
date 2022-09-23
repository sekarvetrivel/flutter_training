import 'package:flutter/material.dart';

Widget mySwitchUsingAdaptive() {
  return Switch.adaptive(value: true, onChanged: (bool value) {});
}
