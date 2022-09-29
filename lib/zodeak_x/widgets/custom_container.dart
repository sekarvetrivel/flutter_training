import 'package:flutter/cupertino.dart';


class ZodeakContainer extends StatelessWidget {
  final double height; // used for container height
  final double width; // used for container width
  final Color? color; // used for container color
  final Decoration? decoration; // add decoration to the container
  final Widget? child; //return widget
  final double? padding; // space around the container
  ZodeakContainer({Key? key,
    this.color,
    this.child,
   required this.width,
   required this.height,
    this.decoration,
    this.padding
     }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/height,
      width: MediaQuery.of(context).size.width/width,
      color: color,
      child: child,
      decoration: decoration,
    );
  }
}

