import 'package:flutter/material.dart';

class MyBadge extends StatelessWidget {
  final double top;
  final double right;
  final bool hide;
  final Widget child; // our badge widget will wrap this child widget
  final String value; // what displays inside the badge
  final Color color; // the  background color of the badge - default is red

  const MyBadge(
      {Key? key,
      required this.child,
      this.value = "",
      this.color = Colors.red,
      required this.top,
      required this.right,
      this.hide = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        hide
            ? Positioned(
                right: value.isNotEmpty ? (right - 2) : right,
                top: value.isNotEmpty ? (top - 2) : top,
                child: CircleAvatar(
                  backgroundColor: this.color,
                  radius: value.isNotEmpty ? 7.5 : 5,
                  child: value.isNotEmpty
                      ? Text(
                          value,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 10, color: Colors.white),
                        )
                      : SizedBox(),
                ),
              )
            : SizedBox()
      ],
    );
  }
}
