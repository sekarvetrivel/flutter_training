import 'package:flutter/material.dart';

class ColumnDownPage extends StatefulWidget {
  const ColumnDownPage({super.key, required this.title});

  final String title;

  @override
  State<ColumnDownPage> createState() => _ColumnDownPageState();
}

class _ColumnDownPageState extends State<ColumnDownPage> {
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
          verticalDirection: VerticalDirection.down,
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
