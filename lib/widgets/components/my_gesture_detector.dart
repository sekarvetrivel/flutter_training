import 'package:flutter/material.dart';

import '../../global/global_functions.dart';
import '../pages/hero_page_route.dart';

Widget myGestureDetector(BuildContext context) {
  return GestureDetector(
    onTap: () {
      navigateToPageSTLess(context, HeroPageRoute());
    },
    child: ClipRect(
      child: Hero(
        tag: "tag",
        child: Image.asset(
          "assets/images/image_3.jpg",
          width: 200,
          height: 200,
        ),
      ),
    ),
  );
}
