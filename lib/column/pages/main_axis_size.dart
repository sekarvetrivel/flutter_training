import 'package:flutter/material.dart';

import '../../global/global_functions.dart';
import 'main_axis_size/column_max.dart';
import 'main_axis_size/column_min.dart';

class MainAxisSizeExamplePage extends StatefulWidget {
  const MainAxisSizeExamplePage({super.key, required this.title});

  final String title;

  @override
  State<MainAxisSizeExamplePage> createState() =>
      _MainAxisSizeExamplePageState();
}

class _MainAxisSizeExamplePageState extends State<MainAxisSizeExamplePage> {
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
                      context, ColumnMinPage(title: "Column Min Example"));
                },
                child: Text('Min')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context, ColumnMaxPage(title: "Column Max Example"));
                },
                child: Text('Max')),
          ],
        ),
      ),
    );
  }
}
