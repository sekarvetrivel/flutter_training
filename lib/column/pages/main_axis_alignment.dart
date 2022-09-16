import 'package:flutter/material.dart';

import '../../global/global_functions.dart';
import 'main_axis/column_center.dart';
import 'main_axis/column_end.dart';
import 'main_axis/column_space_around.dart';
import 'main_axis/column_space_between.dart';
import 'main_axis/column_space_evenly.dart';
import 'main_axis/column_start.dart';

class MainAxisExamplePage extends StatefulWidget {
  const MainAxisExamplePage({super.key, required this.title});

  final String title;

  @override
  State<MainAxisExamplePage> createState() => _MainAxisExamplePageState();
}

class _MainAxisExamplePageState extends State<MainAxisExamplePage> {
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
                      context,
                      ColumnSpaceEvenlyPage(
                          title: "Column Space Evenly Example"));
                },
                child: Text('Space Evenly')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context,
                      ColumnSpaceAroundPage(
                          title: "Column Space Around Example"));
                },
                child: Text('Space Around')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context,
                      ColumnSpaceBetweenPage(
                          title: "Column Space Between Example"));
                },
                child: Text('Space Between')),
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
