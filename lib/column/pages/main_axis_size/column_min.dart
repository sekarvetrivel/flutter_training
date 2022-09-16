import 'package:flutter/material.dart';

class ColumnMinPage extends StatefulWidget {
  const ColumnMinPage({super.key, required this.title});

  final String title;

  @override
  State<ColumnMinPage> createState() => _ColumnMinPageState();
}

class _ColumnMinPageState extends State<ColumnMinPage> {
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
          mainAxisSize: MainAxisSize.min,
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
