import 'package:flutter/material.dart';

class ColumnSpaceAroundPage extends StatefulWidget {
  const ColumnSpaceAroundPage({super.key, required this.title});

  final String title;

  @override
  State<ColumnSpaceAroundPage> createState() => _ColumnSpaceAroundPageState();
}

class _ColumnSpaceAroundPageState extends State<ColumnSpaceAroundPage> {
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
