import 'package:flutter/material.dart';

class ColumnExamplePage extends StatefulWidget {
  const ColumnExamplePage({super.key, required this.title});

  final String title;

  @override
  State<ColumnExamplePage> createState() => _ColumnExamplePageState();
}

class _ColumnExamplePageState extends State<ColumnExamplePage> {
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
