import 'package:flutter/material.dart';

class ShapeWithColorAnimation extends StatefulWidget {
  const ShapeWithColorAnimation({super.key, required this.title});

  final String title;

  @override
  State<ShapeWithColorAnimation> createState() =>
      _ShapeWithColorAnimationState();
}

class _ShapeWithColorAnimationState extends State<ShapeWithColorAnimation>  with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Decoration> _decorationTween;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    _controller.repeat(reverse: true);

    _decorationTween = DecorationTween(
            begin: BoxDecoration(
                color: Colors.blue,
                border: Border.all(width: 30, color: Colors.red),
                borderRadius: BorderRadius.circular(10)),
            end: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(150)))
        .animate(_controller);
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: DecoratedBoxTransition(
            decoration: _decorationTween,
            child: const SizedBox(
              width: 300,
              height: 300,
            )),
      ),
    );
  }
}
