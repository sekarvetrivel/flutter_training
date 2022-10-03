import 'package:flutter/material.dart';
import 'package:flutter_training/training_task/widgets/custom_sized_box.dart';
import 'package:flutter_training/training_task/widgets/custom_text.dart';

import '../../widgets/custom_container.dart';
import '../view/on_boarding_screen.dart';

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
    return CustomContainer(
      width: size.width,
      height: size.height,
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
            bottom: size.height * (horizontalPadding * 2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomContainer(
                  width: size.width * 0.75,
                  height: size.height * 0.15,
                  child: CustomText(
                    text: description,
                    textAlign: TextAlign.start,
                    strutStyleHeight: size.height * (horizontalPadding / 10),
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
                CustomSizedBox(
                  height: size.height * 0.025,
                ),
                CustomText(
                  text: quote,
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
