import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;
  final Decoration? decoration;
  final Widget? child;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;

  CustomContainer({
    Key? key,
    this.color,
    this.child,
    required this.width,
    required this.height,
    this.decoration,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
      child: child,
      decoration: decoration,
      margin: margin ?? EdgeInsets.all(0),
      padding: padding ?? EdgeInsets.all(0),
    );
  }
}
