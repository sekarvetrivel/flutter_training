import 'package:flutter/material.dart';
import 'package:flutter_training/column/pages/vertical_direction/column_down.dart';
import 'package:flutter_training/column/pages/vertical_direction/column_up.dart';

import '../../global/global_functions.dart';
import 'main_axis_size/column_max.dart';
import 'main_axis_size/column_min.dart';

class MainVerticalExamplePage extends StatefulWidget {
  const MainVerticalExamplePage({super.key, required this.title});

  final String title;

  @override
  State<MainVerticalExamplePage> createState() =>
      _MainVerticalExamplePageState();
}

class _MainVerticalExamplePageState extends State<MainVerticalExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context, ColumnUpPage(title: "Column Up Example"));
                },
                child: Text('Up')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context, ColumnDownPage(title: "Column Down Example"));
                },
                child: Text('Down')),
          ],
        ),
      ),
    );
  }
}
