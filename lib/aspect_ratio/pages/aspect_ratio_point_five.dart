import 'package:flutter/material.dart';

class AspectRatioPointFiveExamplePage extends StatefulWidget {
  const AspectRatioPointFiveExamplePage({super.key, required this.title});

  final String title;

  @override
  State<AspectRatioPointFiveExamplePage> createState() =>
      _AspectRatioPointFiveExamplePageState();
}

class _AspectRatioPointFiveExamplePageState extends State<AspectRatioPointFiveExamplePage> {
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
          aspectRatio: 0.5,
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