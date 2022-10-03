import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  double? height;
  double? width;
  Widget? child;

  CustomSizedBox({Key? key, this.height, this.width, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 10.0,
      width: width ?? 10.0,
      child: child,
    );
  }
}
