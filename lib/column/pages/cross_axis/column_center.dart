import 'package:flutter/material.dart';

class ColumnCenterPage extends StatefulWidget {
  const ColumnCenterPage({super.key, required this.title});

  final String title;

  @override
  State<ColumnCenterPage> createState() => _ColumnCenterPageState();
}

class _ColumnCenterPageState extends State<ColumnCenterPage> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
