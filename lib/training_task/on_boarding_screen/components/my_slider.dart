import 'package:flutter/material.dart';

class MySlider extends StatelessWidget {
  String image;

  MySlider({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // image given in slider
          Image(image: AssetImage(image)),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
