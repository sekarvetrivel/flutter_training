import 'package:flutter/material.dart';

class BottomCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(size.width * 0.72, size.height * 0.52);
    path.cubicTo(size.width * 0.35, size.height * 0.52, size.width * 0.12,
        size.height * 0.31, 0, 0);
    path.cubicTo(0, 0, 0, size.height, 0, size.height);
    path.cubicTo(
        0, size.height, size.width, size.height, size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, size.height * 0.47,
        size.width, size.height * 0.47);
    path.cubicTo(size.width * 0.91, size.height / 2, size.width * 0.81,
        size.height * 0.52, size.width * 0.72, size.height * 0.52);
    path.cubicTo(size.width * 0.72, size.height * 0.52, size.width * 0.72,
        size.height * 0.52, size.width * 0.72, size.height * 0.52);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
