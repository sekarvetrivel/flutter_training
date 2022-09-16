import 'package:flutter/material.dart';

import '../components/my_list_tile.dart';

class ListViewSeparatedExamplePage extends StatefulWidget {
  const ListViewSeparatedExamplePage({super.key, required this.title});

  final String title;

  @override
  State<ListViewSeparatedExamplePage> createState() =>
      _ListViewSeparatedExamplePageState();
}

class _ListViewSeparatedExamplePageState extends State<ListViewSeparatedExamplePage> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return MyListTile(
              color: Colors.amber[colorCodes[index]]!,
              text: 'Entry ${entries[index]}');
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
