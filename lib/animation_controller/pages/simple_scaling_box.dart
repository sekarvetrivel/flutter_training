import 'package:flutter/material.dart';

class SimpleScalingBoxExamplePage extends StatefulWidget {
  const SimpleScalingBoxExamplePage({super.key, required this.title});

  final String title;

  @override
  State<SimpleScalingBoxExamplePage> createState() =>
      _SimpleScalingBoxExamplePageState();
}

class _SimpleScalingBoxExamplePageState
    extends State<SimpleScalingBoxExamplePage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _controller.repeat(reverse: true);
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
          animation: _controller,
          builder: (BuildContext _, child) {
            return Transform.scale(
              scale: _controller.value,
              child: child,
            );
          },
          child: Container(
            width: 300,
            height: 200,
            color: Colors.deepOrange,
          ),
        ),
      ),
    );
  }
}
