import 'package:flutter/material.dart';

import '../../global/global_functions.dart';
import 'cross_axis/column_baseline.dart';
import 'cross_axis/column_center.dart';
import 'cross_axis/column_end.dart';
import 'cross_axis/column_start.dart';
import 'cross_axis/column_stretch.dart';

class CrossAxisExamplePage extends StatefulWidget {
  const CrossAxisExamplePage({super.key, required this.title});

  final String title;

  @override
  State<CrossAxisExamplePage> createState() => _CrossAxisExamplePageState();
}

class _CrossAxisExamplePageState extends State<CrossAxisExamplePage> {
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
                  navigateToPageSTFull(context,
                      ColumnBaselinePage(title: "Column Baseline Example"));
                },
                child: Text('Baseline')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(context,
                      ColumnStretchPage(title: "ColumnStretch Example"));
                },
                child: Text('Stretch')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context, ColumnStartPage(title: "Column Start Example"));
                },
                child: Text('Start')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(context,
                      ColumnCenterPage(title: "Column Center Example"));
                },
                child: Text('Center')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context, ColumnEndPage(title: "Column End Example"));
                },
                child: Text('End')),
          ],
        ),
      ),
    );
  }
}
