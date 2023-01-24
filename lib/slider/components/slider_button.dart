import 'package:flutter/material.dart';

class SliderButton extends StatefulWidget {
  final ValueChanged<double> valueChanged;

  final double containerWidth;
  final double containerHeight;
  final Color containerColor;

  final double buttonSize;
  final Color buttonColor;

  final Color textColor;
  final double textSize;

  final String leftText;
  final String rightText;

  final String textResultDeny;
  final String textResultAccept;

  final IconData icon;
  final Color iconColor;

  final Function(BuildContext context)? sliderPrimaryFunction;
  final Function(BuildContext context)? sliderSecondaryFunction;

  SliderButton({
    required this.valueChanged,
    required this.containerWidth,
    required this.containerHeight,
    this.containerColor = Colors.black,
    this.buttonSize = 50,
    this.buttonColor = Colors.white,
    this.rightText = 'Aceptar',
    this.textResultAccept = 'Aceptado',
    this.leftText = 'Denegar',
    this.textResultDeny = 'Denegado',
    this.sliderPrimaryFunction,
    this.sliderSecondaryFunction,
    this.textColor = Colors.white,
    this.textSize = 24,
    this.icon = Icons.add_circle_outline,
    this.iconColor = Colors.black,
  });

  @override
  _SliderButtonState createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  ValueNotifier<double> valueListener = ValueNotifier(.0);
  bool started = false;
  int switchOptions = 0;
  Color? _containerColor = Colors.black;
  IconData _icon = Icons.lock;

  @override
  void initState() {
    valueListener.addListener(notifyParent);
    valueListener.value = 0.5;
    super.initState();
  }

  void notifyParent() {
    this.widget.valueChanged(valueListener.value);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: sliderContainer(),
    );
  }

  sliderContainer() => Stack(
        children: [
          Container(
            width: this.widget.containerWidth,
            height: this.widget.containerHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.00),
              color: _containerColor,
            ),
            child: sliderContainerContent(),
          ),
          Positioned(bottom: 2, child: slider())
        ],
      );

  sliderContainerContent() {
    if (switchOptions == 0) return Center(child: containerContent());
    if (switchOptions == 1)
      return textResult(this.widget.textResultAccept);
    else if (switchOptions == 2) return textResult(this.widget.textResultDeny);
  }

  containerContent() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          started == false ? primaryText(this.widget.leftText) : Container(),
          started == false ? primaryText(this.widget.rightText) : Container(),
        ],
      );

  primaryText(String text) => Container(
        padding: EdgeInsets.all(14.0),
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.white)),
      );

  textResult(String text) => Center(
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .headline3
              ?.copyWith(color: Colors.white)));

  slider() => Container(
        width: this.widget.containerWidth,
        height: this.widget.containerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.00),
          color: Colors.transparent,
        ),
        child: Builder(
          builder: (context) {
            final handle = gestureDetector();
            return animatedBuilder(handle);
          },
        ),
      );

  gestureDetector() => GestureDetector(
        onHorizontalDragUpdate: _slideColor,
        onHorizontalDragStart: (details) {
          setState(() {
            started = true;
          });
        },
        onHorizontalDragEnd: _onSlideDragUpdate,
        child: roundedButton(),
      );

  animatedBuilder(handle) => AnimatedBuilder(
        animation: valueListener,
        builder: (context, child) {
          return AnimatedAlign(
            duration:
                Duration(milliseconds: valueListener.value == 0.5 ? 300 : 0),
            alignment: Alignment(valueListener.value * 2 - 1, .5),
            child: child,
          );
        },
        child: handle,
      );

  roundedButton() => Container(
        width: this.widget.buttonSize,
        height: this.widget.buttonSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: this.widget.buttonColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Icon(_icon,
            color: this.widget.iconColor, size: this.widget.buttonSize - 5),
      );

  void _slideColor(DragUpdateDetails details) {
    valueListener.value =
        (valueListener.value + details.delta.dx / this.widget.containerWidth)
            .clamp(.0, 1.0);

    var sliderColor = 200;
    var slideRight = 0.5;
    var slideLeft = 0.5;
    var i = valueListener.value;
    for (; i > slideRight;) {
      setState(() {
        this._containerColor = Colors.green[sliderColor];
        sliderColor += 100;
        slideRight += 0.1;
        _icon = Icons.lock_open_sharp;
      });
    }
    for (; i < slideLeft;) {
      setState(() {
        this._containerColor = Colors.red[sliderColor];
        sliderColor += 100;
        slideLeft -= 0.1;
        _icon = Icons.lock_outline_sharp;
      });
    }
  }

  void _onSlideDragUpdate(DragEndDetails details) {
    if (valueListener.value >= 0.9) {
      valueListener.value = 1;
      setState(() {
        switchOptions = 1;
        _containerColor = Colors.lightGreen;
        Future.delayed(const Duration(milliseconds: 500), () {
          this.widget.sliderPrimaryFunction ?? Navigator.pop(context);
        });
      });
    } else if (valueListener.value <= 0.1) {
      valueListener.value = 0;
      setState(() {
        switchOptions = 2;
        _containerColor = Theme.of(context).errorColor;
        Future.delayed(const Duration(milliseconds: 500), () {
          this.widget.sliderPrimaryFunction ?? Navigator.pop(context);
        });
      });
    } else {
      valueListener.value = 0.5;
      setState(() {
        _containerColor = Theme.of(context).primaryColorDark;
        _icon = Icons.lock;
        started = false;
      });
    }
  }
}
