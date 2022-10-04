import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  Color? color = Colors.black;
  final Widget? image;
  final Function()? press;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? body;
  final Widget? text;
  final bool? resizeToAvoidBottomInset;
  final appbar;

  CustomScaffold({
    Key? key,
    this.appbar,
    this.color,
    this.image,
    this.text,
    this.press,
    this.bottomNavigationBar,
    this.drawer,
    this.body,
    this.resizeToAvoidBottomInset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      key: key,
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
      backgroundColor: color,
      body: body,
    );
  }
}
