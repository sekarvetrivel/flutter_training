import 'package:flutter/material.dart';

Widget mySliderUsingAdaptive() {
  return Slider.adaptive(value: 1, onChanged: (double value) {});
}