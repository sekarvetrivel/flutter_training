import 'package:flutter/material.dart';

class RadioButtonUsingRadioListTile extends StatefulWidget {
  var result;

  RadioButtonUsingRadioListTile({
    super.key,
    this.result,
  });

  @override
  State<RadioButtonUsingRadioListTile> createState() =>
      _RadioButtonUsingRadioListTileState();
}

class _RadioButtonUsingRadioListTileState
    extends State<RadioButtonUsingRadioListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('1 + 2 + 4 = ?'),
        RadioListTile(
            title: const Text('4'),
            value: 4,
            groupValue: widget.result,
            onChanged: (value) {
              setState(() {
                widget.result = value;
              });
            }),
        RadioListTile(
            title: const Text('5.4'),
            value: 5.4,
            groupValue: widget.result,
            onChanged: (value) {
              setState(() {
                widget.result = value;
              });
            }),
        RadioListTile(
            title: const Text('6'),
            value: 6,
            groupValue: widget.result,
            onChanged: (value) {
              setState(() {
                widget.result = value;
              });
            }),
        RadioListTile(
            title: const Text('7'),
            value: 7,
            groupValue: widget.result,
            onChanged: (value) {
              setState(() {
                widget.result = value;
              });
            }),
        const SizedBox(height: 15),
        Text(widget.result == 7 ? 'Correct!' : 'Please chose the right answer!')
      ],
    );
  }
}
