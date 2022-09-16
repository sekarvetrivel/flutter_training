import 'package:flutter/material.dart';

class DividerPage extends StatefulWidget {
  const DividerPage({super.key, required this.title});

  final String title;

  @override
  State<DividerPage> createState() => _DividerPageState();
}

class _DividerPageState extends State<DividerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  MyExpanded(color: Colors.red, text: "Above \nLeft", textColor: Colors.black, textSize: 20),
                  VerticalDivider(
                    width: 20,
                    thickness: 5,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black,
                  ),
                  MyExpanded(color: Colors.amber, text: "Above \nRight", textColor: Colors.black, textSize: 20),
                ],
              ),
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
            ),
            MyExpanded(color: Colors.blue, text: "Below", textColor: Colors.white, textSize: 24),
          ],
        ),
      ),
    );
  }
}

class MyExpanded extends StatelessWidget {
  const MyExpanded({
    Key? key,
    required this.color,
    required this.text,
    required this.textColor,
    required this.textSize,
  }) : super(key: key);

  final Color color;
  final Color textColor;
  final String text;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: color,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
