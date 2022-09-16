import 'package:flutter/material.dart';

class ColumnSpaceEvenlyPage extends StatefulWidget {
  const ColumnSpaceEvenlyPage({super.key, required this.title});

  final String title;

  @override
  State<ColumnSpaceEvenlyPage> createState() => _ColumnSpaceEvenlyPageState();
}

class _ColumnSpaceEvenlyPageState extends State<ColumnSpaceEvenlyPage> {
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
