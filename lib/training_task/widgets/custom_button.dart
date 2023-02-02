import 'package:flutter/material.dart';
import 'package:fluttertraining/training_task/widgets/custom_container.dart';
import 'package:fluttertraining/training_task/widgets/custom_text.dart';

class CustomButton extends StatefulWidget {
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

  CustomButton({
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
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: widget.press,
        child: CustomContainer(
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
            child: CustomText(
              text: widget.text,
              style: TextStyle(
                color: widget.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
