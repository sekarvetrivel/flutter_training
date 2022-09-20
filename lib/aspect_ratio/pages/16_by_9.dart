import 'package:flutter/material.dart';

class SixteenByNineExamplePage extends StatefulWidget {
  const SixteenByNineExamplePage({super.key, required this.title});

  final String title;

  @override
  State<SixteenByNineExamplePage> createState() => _SixteenByNineExamplePageState();
}

class _SixteenByNineExamplePageState extends State<SixteenByNineExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        width: double.infinity,
        height: 100.0,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
