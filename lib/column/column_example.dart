import 'package:flutter/material.dart';
import '../global/global_functions.dart';
import 'pages/column.dart';
import 'pages/main_axis_alignment.dart';
import 'pages/cross_axis_alignment.dart';
import 'pages/main_axis_size.dart';
import 'pages/vertical_direction.dart';
import 'pages/dynamically_add_child.dart';


class ColumnPage extends StatefulWidget {
  const ColumnPage({super.key, required this.title});

  final String title;

  @override
  State<ColumnPage> createState() => _ColumnPageState();
}

class _ColumnPageState extends State<ColumnPage> {
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
                      context, ColumnExamplePage(title: "Column Example"));
                },
                child: Text('Column')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context, MainAxisExamplePage(title: "Column Main Axis Example"));
                },
                child: Text('Main Axis')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context, CrossAxisExamplePage(title: "Column Cross Axis Example"));
                },
                child: Text('Cross Axis')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context, MainAxisSizeExamplePage(title: "Column Axis Size Example"));
                },
                child: Text('Main Axis Size')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context, MainVerticalExamplePage(title: "Column Vetrical Example"));
                },
                child: Text('Vetrical Direction')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context, AddChildExamplePage(title: "Dynamically Add Child Example"));
                },
                child: Text('Add Child')),
          ],
        ),
      ),
    );
  }
}

