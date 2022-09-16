import 'package:flutter/material.dart';

class BaselineAlphabetic extends StatelessWidget {
  const BaselineAlphabetic({
    Key? key, required this.baseline,
  }) : super(key: key);

  final double baseline;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: 200,
      height: 200,
      color: Colors.teal,
      child: Baseline(
        baseline: baseline,
        baselineType: TextBaseline.alphabetic,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
      ),
    );
  }
}
