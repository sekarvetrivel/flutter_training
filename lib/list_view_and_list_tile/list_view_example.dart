import 'package:flutter/material.dart';

import '../global/global_functions.dart';
import 'pages/list_view.dart';
import 'pages/list_view_builder.dart';
import 'pages/list_view_custom.dart';
import 'pages/list_view_separated.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key, required this.title});

  final String title;

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
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
                      context, ListViewExamplePage(title: "ListView Example"));
                },
                child: Text('ListView')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context,
                      ListViewBuilderExamplePage(
                          title: "ListViewBuilder Example"));
                },
                child: Text('ListView.builder')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context,
                      ListViewSeparatedExamplePage(
                          title: "ListViewSeparated Example"));
                },
                child: Text('ListView.separated')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context,
                      ListViewCustomExamplePage(
                          title: "ListViewCustom Example"));
                },
                child: Text('ListView.custom')),
          ],
        ),
      ),
    );
  }
}
