import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ZodeakBottomNavigationBar extends StatefulWidget {
  final List icon;
  final List label;
  final List screens;
  final double heigth;
  final Color color;
  final Color backgroundColor;
  final BoxFit fit;
  int selectedScreenIndex;

  ZodeakBottomNavigationBar(
      {Key? key,
      required this.icon,
      required this.label,
      required this.screens,
      required this.heigth,
      required this.color,
      required this.backgroundColor,
      required this.selectedScreenIndex,
      required this.fit})
      : super(key: key);

  @override
  State<ZodeakBottomNavigationBar> createState() =>
      _ZodeakBottomNavigationBarState();
}

class _ZodeakBottomNavigationBarState extends State<ZodeakBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.grey,
        unselectedFontSize: 13,
        selectedFontSize: 13,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        currentIndex: widget.selectedScreenIndex,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                widget.icon[0],
                color: Colors.grey,
                height: widget.heigth,
                fit: BoxFit.fill,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                widget.icon[0],
                color: Colors.blue,
                height: widget.heigth,
                fit: BoxFit.fill,
              ),
            ),
            label: widget.label[0],
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  widget.icon[1],
                  color: Colors.grey,
                  height: widget.heigth,
                  fit: BoxFit.fill,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  widget.icon[1],
                  color: Colors.blue,
                  height: widget.heigth,
                  fit: BoxFit.fill,
                ),
              ),
              label: widget.label[1]),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  widget.icon[2],
                  color: Colors.grey,
                  height: widget.heigth,
                  fit: BoxFit.fill,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  widget.icon[2],
                  color: Colors.blue,
                  height: widget.heigth,
                  fit: BoxFit.fill,
                ),
              ),
              label: widget.label[2]),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  widget.icon[3],
                  color: Colors.grey,
                  height: widget.heigth,
                  fit: BoxFit.fill,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  widget.icon[3],
                  color: Colors.blue,
                  height: widget.heigth,
                  fit: BoxFit.fill,
                ),
              ),
              label: widget.label[3]),
        ],
        onTap: (int index) {
          setState(() {
            widget.selectedScreenIndex = index;
          });
          if (widget.selectedScreenIndex == 0)
            widget.screens[0];
          else if (widget.selectedScreenIndex == 1)
            widget.screens[1];
          else if (widget.selectedScreenIndex == 2)
            widget.screens[2];
          else if (widget.selectedScreenIndex == 3) widget.screens[3];
        });
  }
}
