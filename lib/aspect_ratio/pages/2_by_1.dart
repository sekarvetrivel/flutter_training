import 'package:flutter/material.dart';

class TwoByOneExamplePage extends StatefulWidget {
  const TwoByOneExamplePage({super.key, required this.title});

  final String title;

  @override
  State<TwoByOneExamplePage> createState() => _TwoByOneExamplePageState();
}

class _TwoByOneExamplePageState extends State<TwoByOneExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.grey,
        alignment: Alignment.topCenter,
        child: AspectRatio(
          aspectRatio: 2 / 1,
          child: Container(
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
