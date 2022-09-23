import 'package:flutter/material.dart';
import 'package:flutter_training/global/global_functions.dart';
import 'package:flutter_training/widgets/pages/my_sliver_app_bar.dart';

Widget mySliverAppBar(BuildContext context) {
  return ElevatedButton(onPressed: () {
    navigateToPageSTFull(context, MySliverAppBar());
  }, child: Text("Sliver AppBar"));
}
