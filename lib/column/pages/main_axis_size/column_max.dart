import 'package:flutter/material.dart';

class ColumnMaxPage extends StatefulWidget {
  const ColumnMaxPage({super.key, required this.title});

  final String title;

  @override
  State<ColumnMaxPage> createState() => _ColumnMaxPageState();
}

class _ColumnMaxPageState extends State<ColumnMaxPage> {
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
          mainAxisSize: MainAxisSize.max,
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
