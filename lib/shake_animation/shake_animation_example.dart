import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShakeAnimationPage extends StatefulWidget {
  const ShakeAnimationPage({super.key, required this.title});

  final String title;

  @override
  State<ShakeAnimationPage> createState() => _ShakeAnimationPageState();
}

class _ShakeAnimationPageState extends State<ShakeAnimationPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: -0.5, end: 0.5).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
    _animationController.forward();
    // The looping is done via listener.
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _animationController.reverse();
      }
      if (_animationController.isDismissed) {
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => Transform.rotate(
            angle: _animation.value,
            child: Icon(
              Icons.back_hand_sharp,
              size: 50.0,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}
