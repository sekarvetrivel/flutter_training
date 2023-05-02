import 'package:flutter/material.dart';
import 'package:swipe_deck/swipe_deck.dart';

const IMAGES = ["_1", "_2", "_3", "_4", "_5"];
final borderRadius = BorderRadius.circular(20.0);

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe Deck"),
      ),
      body: Center(
        child: Container(
          width: 600,
          child: Center(
            child: SwipeDeck(
              startIndex: 0,
              emptyIndicator: Container(
                child: Center(
                  child: Text("Nothing Here"),
                ),
              ),
              cardSpreadInDegrees: 5,
              // Change the Spread of Background Cards
              onSwipeLeft: () {
                print("USER SWIPED LEFT -> GOING TO NEXT WIDGET");
              },
              onSwipeRight: () {
                print("USER SWIPED RIGHT -> GOING TO PREVIOUS WIDGET");
              },
              onChange: (index) {
                print(IMAGES[index]);
              },
              widgets: IMAGES
                  .map((e) => GestureDetector(
                        onTap: () {
                          print(e);
                        },
                        child: ClipRRect(
                            borderRadius: borderRadius,
                            child: Image.asset(
                              "assets/images/image$e.jpg",
                              fit: BoxFit.cover,
                            )),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
