import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  TextDecoration? decoration;
  String? fontfamily;
  FontStyle? fontStyle;
  TextStyle? style;
  double? fontsize = 15.0;
  int? maxlines;

  bool? softwrap;
  FontWeight? fontWeight = FontWeight.normal;
  Color? color = Colors.black;
  TextOverflow? overflow = TextOverflow.visible;
  TextAlign? textAlign;

  final Function()? press;
  final double? strutStyleHeight;

  CustomText({
    Key? key,
    required this.text,
    this.fontsize,
    this.fontWeight,
    this.color,
    this.overflow,
    this.textAlign,
    this.press,
    this.maxlines,
    this.softwrap,
    this.decoration,
    this.fontfamily,
    this.fontStyle,
    this.style,
    this.strutStyleHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Text(
        text,
        style: style,
        textAlign: textAlign,
        maxLines: maxlines,
        overflow: overflow,
        strutStyle: StrutStyle(
          height: strutStyleHeight,
        ),
      ),
    );
  }
}
