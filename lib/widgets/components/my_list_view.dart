import 'package:flutter/material.dart';

Widget myListView() {
  return ListView.builder(
    itemCount: 5,
    padding: EdgeInsets.all(16.0),
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    // spacing of the rows
    itemExtent: 30.0,
    // provides an infinite list
    itemBuilder: (BuildContext context, int index) {
      return Text('Row $index');
    },
  );
}
