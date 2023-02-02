import 'package:flutter/material.dart';
import 'package:fluttertraining/global/global_functions.dart';

class AbsorbPointerPage extends StatefulWidget {
  const AbsorbPointerPage({super.key, required this.title});

  final String title;

  @override
  State<AbsorbPointerPage> createState() => _AbsorbPointerPageState();
}

class _AbsorbPointerPageState extends State<AbsorbPointerPage> {
  bool _absorbing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AbsorbPointer(
              absorbing: _absorbing,
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan[300],
                    ),
                    child: Text('Press the button'),
                    onPressed: () {
                      mySnackBar(context, 'Button is pressed');
                    },
                  ),
                  TextField(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Absorb Pointer?'),
                Switch(
                  activeColor: Colors.cyan[300],
                  value: _absorbing,
                  onChanged: (bool value) {
                    setState(() {
                      _absorbing = value;
                    });
                  },
                ),
              ],
            ),
            Text('with out AbsorbPointer'),
            Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      print("Red Pressed");
                    },
                    child: Container(color: Colors.red, width: 50, height: 50,)),
                GestureDetector(
                    onTap: () {
                      print("blue");
                    },
                    child:
                        Container(width: 42, height: 42, color: Colors.blue)),
              ],
            ),
            Text('with AbsorbPointer'),
            Stack(
              alignment: Alignment.center,
              children: [
                InkWell(
                    onTap: () {
                      print("Red Pressed");
                    },
                    child: Container(color: Colors.red, width: 50, height: 50,)),
                AbsorbPointer(
                  absorbing: _absorbing,
                  child: InkWell(
                      onTap: () {
                        print("blue");
                      },
                      child:
                      Container(width: 42, height: 42, color: Colors.blue)),
                ),
              ],
            ),
            Text('with IgnorePointer'),
            Stack(
              alignment: Alignment.center,
              children: [
                InkWell(
                    onTap: () {
                      print("Red Pressed");
                    },
                    child: Container(color: Colors.red, width: 50, height: 50,)),
                IgnorePointer(
                  child: InkWell(
                      onTap: () {
                        print("blue");
                      },
                      child:
                      Container(width: 42, height: 42, color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
