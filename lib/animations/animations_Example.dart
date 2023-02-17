import 'package:flutter/material.dart';

class Animations extends StatefulWidget {
  @override
  _AnimationsState createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> with TickerProviderStateMixin {
  var _width = 200.0;
  double elipticalValue = 50;
  late AnimationController _reviewController;
  late Animation<double> _reviewAnimation;
  late AnimationController _tickController;
  late Animation<double> _tickAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _reviewController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _reviewAnimation = Tween(begin: 1.0, end: 0.0).animate(_reviewController);
    _tickController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _tickAnimation = Tween(begin: 0.0, end: 1.0).animate(_tickController);
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  animateContainer() {
    setState(() {
      _width = 50;
      _reviewController.forward();
      _tickController.forward();
      Future.delayed(Duration(milliseconds: 50), () {
        elipticalValue = 100;
      });
    });
  }

  resetContainer() {
    setState(() {
      _width = 200;
      _reviewController.reverse();
      Future.delayed(Duration(milliseconds: 50), () {
        _tickController.reverse();
        elipticalValue = 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Container Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Stack(
                  children: [
                    FadeTransition(
                      opacity: _tickAnimation,
                      child: AnimatedContainer(
                        curve: Curves.fastOutSlowIn,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(100, elipticalValue))),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        duration: Duration(seconds: 1),
                        height: 50,
                        width: _width,
                      ),
                    ),
                    FadeTransition(
                      opacity: _reviewAnimation,
                      child: AnimatedContainer(
                        curve: Curves.fastOutSlowIn,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                            child: Text(
                          "Leave a Review",
                          style: TextStyle(color: Colors.white),
                        )),
                        duration: Duration(seconds: 1),
                        height: 50,
                        width: _width,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text("Animate"),
              onPressed: () {
                animateContainer();
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text("reset"),
              onPressed: () {
                resetContainer();
              },
            ),
          ],
        ),
      ),
    );
  }
}
