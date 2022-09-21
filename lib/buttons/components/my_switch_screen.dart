
import 'package:flutter/material.dart';

class MySwitchScreen extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Switch(
            value: isSwitched,
            activeColor: Colors.blue,
            onChanged: (value) {
              print("VALUE : $value");
              setState(() {
                isSwitched = value;
              });
            },
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            'Value : $isSwitched',
            style: TextStyle(color: Colors.red, fontSize: 25.0),
          )
        ]);
  }
}