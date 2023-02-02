import 'package:flutter/material.dart';
import 'package:fluttertraining/global/global_functions.dart';
import 'package:fluttertraining/widgets/pages/my_sliver_app_bar.dart';

Widget mySliverAppBar(BuildContext context) {
  return ElevatedButton(onPressed: () {
    navigateToPageSTFull(context, MySliverAppBar());
  }, child: Text("Sliver AppBar"));
}
