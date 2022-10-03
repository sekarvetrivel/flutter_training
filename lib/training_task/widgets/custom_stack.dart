import 'package:flutter/material.dart';

class CustomStack extends StatelessWidget {
  final List<Widget> children;
  final AlignmentGeometry alignment;

  CustomStack({
    Key? key,
    required this.children,
    required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children,
      alignment: alignment,
    );
  }
}
