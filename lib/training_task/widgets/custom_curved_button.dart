import 'package:flutter/material.dart';

class CustomCurvedButton extends StatefulWidget {
  final String text;
  final VoidCallback? press;
  final double radius;
  final bool isBorderedButton;
  final double borderWidth;
  final Color buttonColor;
  final Color borderColor;
  final Color textColor;
  final double height;
  final double width;
  final BorderRadius borderRadius;

  CustomCurvedButton({
    super.key,
    required this.text,
    this.press,
    required this.radius,
    required this.buttonColor,
    required this.borderColor,
    required this.textColor,
    required this.width,
    required this.height,
    required this.isBorderedButton,
    required this.borderWidth,
    required this.borderRadius,
  });

  @override
  State<CustomCurvedButton> createState() => _CustomCurvedButtonState();
}

class _CustomCurvedButtonState extends State<CustomCurvedButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: widget.press,
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: widget.borderRadius,
            border: widget.isBorderedButton
                ? Border.all(
                    width: widget.borderWidth,
                    color: widget.borderColor,
                    style: BorderStyle.solid,
                  )
                : Border.all(
                    width: 0,
                    color: Colors.transparent,
                    style: BorderStyle.solid,
                  ),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(color: widget.textColor, fontWeight: FontWeight.bold, fontSize: 20,),
            ),
          ),
        ),
      ),
    );
  }
}
