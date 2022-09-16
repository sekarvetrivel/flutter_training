import 'package:flutter/material.dart';

class ColumnSpaceBetweenPage extends StatefulWidget {
  const ColumnSpaceBetweenPage({super.key, required this.title});

  final String title;

  @override
  State<ColumnSpaceBetweenPage> createState() => _ColumnSpaceBetweenPageState();
}

class _ColumnSpaceBetweenPageState extends State<ColumnSpaceBetweenPage> {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
