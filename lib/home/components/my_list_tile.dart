import 'package:flutter/material.dart';

import '../../global/global_functions.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    Key? key,
    required this.items,
    required this.index,
  }) : super(key: key);

  final List<String> items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        items[index],
        style: TextStyle(
          fontSize: 16,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        navigateTo(context, index);
      },
    );
  }
}
