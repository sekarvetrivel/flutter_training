import 'package:flutter/material.dart';

import '../home/main.dart';
//
// void main() {
//   runApp(SplashScreenPage());
// }

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Training',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
