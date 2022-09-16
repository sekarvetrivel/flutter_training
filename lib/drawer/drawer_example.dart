import 'package:flutter/material.dart';

import 'components/my_drawer.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key, required this.title});

  final String title;

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: null,
      ),
      drawer: MyDrawer(),
      endDrawer: MyDrawer(),
    );
  }
}