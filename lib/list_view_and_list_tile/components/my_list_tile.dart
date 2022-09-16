import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        height: 50,
        color: color,
        child: Center(child: Text(text)),
      ),
    );
  }
}
