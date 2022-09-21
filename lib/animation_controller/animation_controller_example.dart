import 'package:flutter/material.dart';

import '../global/global_functions.dart';
import 'pages/animation_based_classes.dart';
import 'pages/color_animation.dart';
import 'pages/icon_and_screen_animation.dart';
import 'pages/shape_with_color.dart';
import 'pages/simple_scaling_box.dart';

class AnimationControllerPage extends StatefulWidget {
  const AnimationControllerPage({super.key, required this.title});

  final String title;

  @override
  State<AnimationControllerPage> createState() =>
      _AnimationControllerPageState();
}

class _AnimationControllerPageState extends State<AnimationControllerPage> {
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
                navigateToPageSTFull(context,
                    SimpleScalingBoxExamplePage(title: "ScalingBox Example"));
              },
              child: Text('ScalingBox'),
            ),
            ElevatedButton(
              onPressed: () {
                navigateToPageSTFull(context,
                    ColorAnimationExamplePage(title: "ColorAnimation Example"));
              },
              child: Text('ColorAnimation'),
            ),
            ElevatedButton(
              onPressed: () {
                navigateToPageSTFull(
                    context,
                    IconAndScreenAnimationExamplePage(
                        title: "IconAndScreenAnimation Example"));
              },
              child: Text('IconAndScreenAnimation'),
            ),
            ElevatedButton(
              onPressed: () {
                navigateToPageSTFull(
                    context,
                    ShapeWithColorAnimation(
                        title: "ScaleWithColorAnimation Example"));
              },
              child: Text('ScaleWithColorAnimation'),
            ),
            ElevatedButton(
              onPressed: () {
                navigateToPageSTFull(
                    context,
                    AnimationBasedClassesExamplePage(
                        title: "AnimationBasedClasses Example"));
              },
              child: Text('AnimationBasedClasses'),
            ),
          ],
        ),
      ),
    );
  }
}
