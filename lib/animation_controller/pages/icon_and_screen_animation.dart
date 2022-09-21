import 'dart:math';

import 'package:flutter/material.dart';

import '../components/animated_screen_example.dart';

class IconAndScreenAnimationExamplePage extends StatefulWidget {
  const IconAndScreenAnimationExamplePage({super.key, required this.title});

  final String title;

  @override
  State<IconAndScreenAnimationExamplePage> createState() =>
      _IconAndScreenAnimationExamplePageState();
}

class _IconAndScreenAnimationExamplePageState
    extends State<IconAndScreenAnimationExamplePage>
    with TickerProviderStateMixin {
  late Animation _arrowAnimation, _heartAnimation;
  late AnimationController _arrowAnimationController, _heartAnimationController;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);

    _heartAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _heartAnimation = Tween(begin: 150.0, end: 170.0).animate(CurvedAnimation(
        curve: Curves.bounceOut, parent: _heartAnimationController));

    _heartAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _heartAnimationController.repeat();
      }
    });
  }

  Widget firstChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        AnimatedBuilder(
          animation: _arrowAnimationController,
          builder: (context, child) => Transform.rotate(
            angle: _arrowAnimation.value,
            child: Icon(
              Icons.expand_more,
              size: 50.0,
              color: Colors.black,
            ),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            _arrowAnimationController.isCompleted
                ? _arrowAnimationController.reverse()
                : _arrowAnimationController.forward();
          },
          child: Text('Start Icon Animation'),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(Colors.black),
            shadowColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.onSurface),
            overlayColor:
                MaterialStateColor.resolveWith((states) => Colors.red),
          ),
        ),
      ],
    );
  }

  Widget secondChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: AnimatedBuilder(
            animation: _heartAnimationController,
            builder: (context, child) {
              return Center(
                child: Container(
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: _heartAnimation.value,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: OutlinedButton(
              child: Text('Start Beating Heart Animation'),
              onPressed: () {
                _heartAnimationController.forward();
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                shadowColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.onSurface),
                overlayColor:
                    MaterialStateColor.resolveWith((states) => Colors.red),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          firstChild(),
          SizedBox(
            height: 50.0,
          ),
          secondChild(),
          SizedBox(
            height: 50.0,
          ),
          OutlinedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              shadowColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.onSurface),
              overlayColor:
                  MaterialStateColor.resolveWith((states) => Colors.red),
            ),
            child: Text('Start Container Animation'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AnimatedScreen()));
            },
          )
        ],
      ),
    );
  }
}
