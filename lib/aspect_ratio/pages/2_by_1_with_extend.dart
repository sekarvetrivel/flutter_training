import 'package:flutter/material.dart';

class TwoByOneWithExtendExamplePage extends StatefulWidget {
  const TwoByOneWithExtendExamplePage({super.key, required this.title});

  final String title;

  @override
  State<TwoByOneWithExtendExamplePage> createState() =>
      _TwoByOneWithExtendExamplePageState();
}

class _TwoByOneWithExtendExamplePageState
    extends State<TwoByOneWithExtendExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Align(
              child: AspectRatio(
                aspectRatio: 2 / 1,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.teal,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
