import 'package:flutter/material.dart';

class ColumnStretchPage extends StatefulWidget {
  const ColumnStretchPage({super.key, required this.title});

  final String title;

  @override
  State<ColumnStretchPage> createState() => _ColumnStretchPageState();
}

class _ColumnStretchPageState extends State<ColumnStretchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: 300,
        color: Color.fromARGB(100, 200, 200, 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          textBaseline: TextBaseline.alphabetic,
          children: [
            FlutterLogo(
              size: 50,
            ),
            const Text('Flutter Training',
                style: const TextStyle(color: Colors.teal)),
            Icon(Icons.widgets),
          ],
        ),
      ),
    );
  }
}
