import 'package:flutter/material.dart';

import '../on_boarding_screen.dart';

class OnBoardPageSlide extends StatelessWidget {
  const OnBoardPageSlide({
    super.key,
    required this.image,
    required this.description,
    required this.quote,
  });

  final String image;
  final String description;
  final String quote;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: size.width * horizontalPadding,
            right: size.width * horizontalPadding,
            bottom: size.height * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width * 0.75,
                  child: Text(
                    description,
                    textAlign: TextAlign.start,
                    strutStyle: StrutStyle(
                      height: size.height * 0.005,
                    ),
                    style: TextStyle(
                      letterSpacing: 1,
                      height: size.height * 0.0015,
                      background: Paint()
                        ..color = Colors.white
                        ..style = PaintingStyle.fill,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Text(
                  quote,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
