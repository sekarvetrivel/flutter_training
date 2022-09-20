import 'package:flutter/material.dart';

class OneByTwoExamplePage extends StatefulWidget {
  const OneByTwoExamplePage({super.key, required this.title});

  final String title;

  @override
  State<OneByTwoExamplePage> createState() => _OneByTwoExamplePageState();
}

class _OneByTwoExamplePageState extends State<OneByTwoExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AspectRatio(
        aspectRatio: 1 / 2,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.teal,
        ),
      ),
    );
  }
}
