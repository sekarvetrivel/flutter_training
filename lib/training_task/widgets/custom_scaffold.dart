import 'package:flutter/material.dart';
import 'package:flutter_training/training_task/widgets/custom_icon_button.dart';

class CustomScaffold extends StatelessWidget {
  Color? color = Colors.black;
  final Widget? image;
  final Function()? press;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? body;
  final Widget? text;

  CustomScaffold({
    Key? key,
    this.color,
    this.image,
    this.text,
    this.press,
    this.bottomNavigationBar,
    this.drawer,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
      backgroundColor: color,
      body: body,
    );
  }
}
