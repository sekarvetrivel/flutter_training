import 'package:flutter/material.dart';

import '../global/global_functions.dart';
import 'pages/16_by_9.dart';
import 'pages/1_by_2.dart';
import 'pages/1_by_3.dart';
import 'pages/2_by_1.dart';
import 'pages/2_by_1_with_extend.dart';
import 'pages/aspect_ratio_2.dart';
import 'pages/aspect_ratio_point_five.dart';

class AspectRatioPage extends StatefulWidget {
  const AspectRatioPage({super.key, required this.title});

  final String title;

  @override
  State<AspectRatioPage> createState() => _AspectRatioPageState();
}

class _AspectRatioPageState extends State<AspectRatioPage> {
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
                    context, TwoByOneExamplePage(title: "TwoByOne Example"));
              },
              child: Text('TwoByOne'),
            ),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(context,
                      OneByThreeExamplePage(title: "OneByThree Example"));
                },
                child: Text('OneByThree')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context, OneByTwoExamplePage(title: "OneByTwo Example"));
                },
                child: Text('OneByTwo')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(
                      context,
                      TwoByOneWithExtendExamplePage(
                          title: "TwoByOneWithExtend Example"));
                },
                child: Text('TwoByOneWithExtend')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(context,
                      SixteenByNineExamplePage(title: "SixteenByNine Example"));
                },
                child: Text('SixteenByNine')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(context,
                      AspectRatio2ExamplePage(title: "AspectRatio2 Example"));
                },
                child: Text('AspectRatio2')),
            ElevatedButton(
                onPressed: () {
                  navigateToPageSTFull(context,
                      AspectRatioPointFiveExamplePage(title: "AspectRatioPointFive Example"));
                },
                child: Text('AspectRatioPointFive')),
          ],
        ),
      ),
    );
  }
}
