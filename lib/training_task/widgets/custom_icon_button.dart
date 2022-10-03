import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  Color? color = Colors.black;
  final Function()? onPress;
  final Widget? child;

  CustomIconButton({
    Key? key,
    this.onPress,
    this.color,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: child!,
      splashRadius: 2,
    );
  }
}
