import 'package:flutter/material.dart';

import '../buttons_example.dart';

class MyChoiceCard extends StatelessWidget {
  const MyChoiceCard({Key? key, required this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context)
        .textTheme
        .headline1!
        .copyWith(color: Colors.white, fontWeight: FontWeight.bold);
    return Card(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 115.0, color: textStyle?.color),
            Text(choice.name, style: textStyle),
          ],
        ),
      ),
    );
  }
}
