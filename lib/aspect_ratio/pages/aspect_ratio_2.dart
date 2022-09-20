import 'package:flutter/material.dart';

class AspectRatio2ExamplePage extends StatefulWidget {
  const AspectRatio2ExamplePage({super.key, required this.title});

  final String title;

  @override
  State<AspectRatio2ExamplePage> createState() =>
      _AspectRatio2ExamplePageState();
}

class _AspectRatio2ExamplePageState extends State<AspectRatio2ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        width: 100.0,
        height: 100.0,
        child: AspectRatio(
          aspectRatio: 2.0,
          child: Container(
            width: 100.0,
            height: 50.0,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
