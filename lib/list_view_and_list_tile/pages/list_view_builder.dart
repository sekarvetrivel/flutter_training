import 'package:flutter/material.dart';

import '../components/my_list_tile.dart';

class ListViewBuilderExamplePage extends StatefulWidget {
  const ListViewBuilderExamplePage({super.key, required this.title});

  final String title;

  @override
  State<ListViewBuilderExamplePage> createState() =>
      _ListViewBuilderExamplePageState();
}

class _ListViewBuilderExamplePageState
    extends State<ListViewBuilderExamplePage> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return MyListTile(
                color: Colors.amber[colorCodes[index]]!,
                text: 'Entry ${entries[index]}');
          }),
    );
  }
}
