import 'package:flutter/material.dart';

class MyChoiceChip extends StatefulWidget {
  const MyChoiceChip({Key? key}) : super(key: key);

  @override
  _MyChoiceChipState createState() => _MyChoiceChipState();
}

class _MyChoiceChipState extends State<MyChoiceChip> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      avatar: Image.asset("assets/images/splash.png"),
      label: Text("Choice Chip"),
      selected: isSelected,
      onSelected: (value) {
        setState(() {
          isSelected = value;
        });
      },
    );
  }
}
