import 'package:flutter/material.dart';

class OneByThreeExamplePage extends StatefulWidget {
  const OneByThreeExamplePage({super.key, required this.title});

  final String title;

  @override
  State<OneByThreeExamplePage> createState() => _OneByThreeExamplePageState();
}

class _OneByThreeExamplePageState extends State<OneByThreeExamplePage> {
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
          aspectRatio: 1 / 3,
          child: Container(
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
