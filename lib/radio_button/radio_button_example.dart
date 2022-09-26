import 'package:flutter/material.dart';
import 'package:flutter_training/radio_button/pages/custom_radio_button_example.dart';
import 'package:flutter_training/radio_button/pages/radio_button_using_radio_list_tile.dart';

import 'pages/radio_button_using_radio.dart';
import 'pages/styled_radio_button_example.dart';

class RadioButtonPage extends StatefulWidget {
  const RadioButtonPage({super.key, required this.title});

  final String title;

  @override
  State<RadioButtonPage> createState() => _RadioButtonPageState();
}

class _RadioButtonPageState extends State<RadioButtonPage> {
  String _selectedGender = 'male';
  var _result;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headingWithBreak('Using Radio', false),
                    RadioButtonUsingRadio(selectedGender: _selectedGender),
                    headingWithBreak('Using RadioLstTile', true),
                    RadioButtonUsingRadioListTile(result: _result),
                    headingWithBreak('Styled RadioButton', true),
                    StyledRadioButtonExample(),
                    headingWithBreak('Custom RadioButton', true),
                    CustomRadioButtonExample(),
                  ],
                )),
          ],
        ),
      )),
    );
  }

  Column lineWithBreak() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Divider(
          color: Colors.black,
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget headingWithBreak(String heading, bool line) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        line ? lineWithBreak() : SizedBox.shrink(),
        Text(
          heading,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15)
      ],
    );
  }

}
