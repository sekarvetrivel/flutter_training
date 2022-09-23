import 'package:flutter/material.dart';

class HeroPageRoute extends StatelessWidget {
  const HeroPageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: "tag",
        child: Image.asset("assets/images/image_3.jpg"),
      ),
    );
  }
}
