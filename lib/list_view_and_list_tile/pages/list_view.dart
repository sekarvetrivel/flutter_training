import 'package:flutter/material.dart';

import '../components/my_list_tile.dart';

class ListViewExamplePage extends StatefulWidget {
  const ListViewExamplePage({super.key, required this.title});

  final String title;

  @override
  State<ListViewExamplePage> createState() => _ListViewExamplePageState();
}

class _ListViewExamplePageState extends State<ListViewExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          MyListTile(
            color: Colors.amber[600]!,
            text: 'Entry A',
          ),
          MyListTile(
            color: Colors.amber[500]!,
            text: 'Entry B',
          ),
          MyListTile(
            color: Colors.amber[100]!,
            text: 'Entry C',
          ),
        ],
      ),
    );
  }
}

