import 'package:flutter/material.dart';

class ColumnEndPage extends StatefulWidget {
  const ColumnEndPage({super.key, required this.title});

  final String title;

  @override
  State<ColumnEndPage> createState() => _ColumnEndPageState();
}

class _ColumnEndPageState extends State<ColumnEndPage> {
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
          crossAxisAlignment: CrossAxisAlignment.end,
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
