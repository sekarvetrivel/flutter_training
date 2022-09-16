import 'package:flutter/material.dart';

class ColumnUpPage extends StatefulWidget {
  const ColumnUpPage({super.key, required this.title});

  final String title;

  @override
  State<ColumnUpPage> createState() => _ColumnUpPageState();
}

class _ColumnUpPageState extends State<ColumnUpPage> {
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
          verticalDirection: VerticalDirection.up,
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
