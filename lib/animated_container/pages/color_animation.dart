import 'package:flutter/material.dart';

class ColorAnimationExamplePage extends StatefulWidget {
  const ColorAnimationExamplePage({super.key, required this.title});

  final String title;

  @override
  State<ColorAnimationExamplePage> createState() =>
      _ColorAnimationExamplePageState();
}

class _ColorAnimationExamplePageState extends State<ColorAnimationExamplePage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorTween;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _controller.repeat(reverse: true);

    _colorTween = ColorTween(begin: Colors.deepOrange, end: Colors.deepPurple)
        .animate(_controller);
  }

  @override
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
        child: AnimatedBuilder(
          animation: _colorTween,
          builder: (BuildContext _, child) {
            return Container(
              width: 300,
              height: 200,
              color: _colorTween.value,
            );
          },
        ),
      ),
    );
  }
}
