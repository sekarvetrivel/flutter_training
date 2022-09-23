import 'package:flutter/material.dart';
import 'package:flutter_training/tab_controller/pages/default_tab_controller.dart';
import 'package:flutter_training/tab_controller/pages/tab_controller.dart';

import '../global/global_functions.dart';

class TabControllerPage extends StatefulWidget {
  const TabControllerPage({super.key, required this.title});

  final String title;

  @override
  State<TabControllerPage> createState() => _TabControllerPageState();
}

class _TabControllerPageState extends State<TabControllerPage> {
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
                      TabControllerExamplePage(title: "TabController Example"));
                },
                child: Text('TabController')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context,
                      DefaultTabControllerExamplePage(
                          title: "DefaultTabController Example"));
                },
                child: Text('DefaultTabController')),
          ],
        ),
      ),
    );
  }
}
