import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_container.dart';
import 'custom_text.dart';

class CustomElevatedButton extends StatefulWidget {
  String text; //used for Button name
  final VoidCallback? press; //used for navigate

  final double radius; //used for button shape
  final bool isBorderedButton; //checking borderedButton or not
  final Color buttoncolor; //color for button
  final double height; //height for button
  final double width; //width for button
  final int maxLines; //maximum lines in button
  final bool icons; //checking, button have icon or not
  final String? icon; // declare icon for button
  bool? shadow; // checking button have shadow or not
  final double? blurRadius; // around the button have blurRadius
  final double? spreadRadius; //  around the button have spreadRadius
  final Offset? offset;
  Color? color = Colors.black;

  CustomElevatedButton({
    Key? key,
    required this.text,
    this.press,
    required this.radius,
    required this.buttoncolor,
    required this.width,
    required this.height,
    required this.isBorderedButton,
    required this.maxLines,
    required this.icons,
    required this.icon,
    this.shadow,
    this.blurRadius,
    this.color,
    this.spreadRadius,
    this.offset,
  }) : super(key: key);

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  bool _clicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: //_clicked ?
          widget.press,
      child: ZodeakContainer(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: widget.isBorderedButton == true
              ? BorderRadius.circular(widget.radius)
              : BorderRadius.circular(widget.radius),
          color: widget.buttoncolor,
          boxShadow: [
            BoxShadow(
              color: Colors.yellow,
              offset: widget.offset ?? Offset(0, 0), //(x,y)
              blurRadius: widget.blurRadius ?? 16,
              spreadRadius: widget.spreadRadius ?? 4,
            ),
          ],
        ),
        child: Center(
          child: Center(
            child: widget.icons == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: SvgPicture.asset(widget.icon!, height: 10),
                      ),
                      ZodeakXText(
                        text: '  ${widget.text}',
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                        fontsize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  )
                : ZodeakXText(
                    text: widget.text,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                    fontsize: 14,
                    fontWeight: FontWeight.bold,
                  ),
          ),
        ),
      ),
    );
  }

  navigate(BuildContext context) {
    return Image.network(
      'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
      width: 100,
      height: 100,
      fit: BoxFit.contain,
    );
  }
}
