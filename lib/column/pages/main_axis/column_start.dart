import 'package:flutter/material.dart';

class ColumnStartPage extends StatefulWidget {
  const ColumnStartPage({super.key, required this.title});

  final String title;

  @override
  State<ColumnStartPage> createState() => _ColumnStartPageState();
}

class _ColumnStartPageState extends State<ColumnStartPage> {
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
          mainAxisAlignment: MainAxisAlignment.start,
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
