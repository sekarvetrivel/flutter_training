
import 'package:flutter/material.dart';

class ZodeakXText extends StatelessWidget {
  final String text; // add text
  TextDecoration ? decoration; // add decoration like TextDecoration.underline ,
  String  ? fontfamily; // add fontFamily like    fontFamily: "Roboto",
  FontStyle ? fontStyle; // add fontStyle like  fontStyle: FontStyle.italic
  double? fontsize = 15.0; // add size in text
  int? maxlines ; // add text maximum lines
  bool ? softwrap; // wrap the text
  FontWeight? fontWeight = FontWeight.normal; // add fontWeight like normal, bold....
  Color? color = Colors.black; // add text color
  TextOverflow? overflow = TextOverflow.visible; // add text overflow like  text ellipsis etc
  TextAlign? align ; // used to align the text like center ,top,....
  final Function()? press; // used to add functionality on text
  final double? strutStyleHeight;
  ZodeakXText({Key? key,
    required this.text,
    this.fontsize,
    this.fontWeight,
    this.color,
    this.overflow,
    this.align,
    this.press,
    this.maxlines,
    this.softwrap,
    this.decoration,
    this.fontfamily,
    this.fontStyle,
    this.strutStyleHeight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,

      child: Text(
        text,
        style: TextStyle(

         fontFamily:fontfamily ,
          decoration: decoration,
          fontSize: fontsize,
          fontWeight: fontWeight,
          color: color,
          overflow: overflow,
            fontStyle: fontStyle,
        ),
        textAlign: align,
        maxLines: maxlines,
        overflow: overflow,
        strutStyle: StrutStyle(
          height: strutStyleHeight,
        ),
      ),
    );
  }
}