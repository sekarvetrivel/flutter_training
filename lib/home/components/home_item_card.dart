import 'package:flutter/material.dart';

import '../../global/global_functions.dart';

class HomeItemCard extends StatelessWidget {
  const HomeItemCard({
    Key? key,
    required this.items,
    required this.index,
  }) : super(key: key);

  final List<String> items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        title: Center(
          child: Card(
            margin: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.blue,
            elevation: 10,
            child: Center(
              child: Text(
                items[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        navigateTo(context, index);
      },
    );
  }
}
