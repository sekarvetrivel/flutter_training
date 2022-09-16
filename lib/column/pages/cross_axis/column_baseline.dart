import 'package:flutter/material.dart';

class ColumnBaselinePage extends StatefulWidget {
  const ColumnBaselinePage({super.key, required this.title});

  final String title;

  @override
  State<ColumnBaselinePage> createState() => _ColumnBaselinePageState();
}

class _ColumnBaselinePageState extends State<ColumnBaselinePage> {
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
          crossAxisAlignment: CrossAxisAlignment.baseline,
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
