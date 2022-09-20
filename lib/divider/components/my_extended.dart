import 'package:flutter/material.dart';

class MyExpanded extends StatelessWidget {
  const MyExpanded({
    Key? key,
    required this.color,
    required this.text,
    required this.textColor,
    required this.textSize,
  }) : super(key: key);

  final Color color;
  final Color textColor;
  final String text;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: color,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
