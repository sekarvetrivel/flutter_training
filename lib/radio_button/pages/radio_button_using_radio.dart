import 'package:flutter/material.dart';

class RadioButtonUsingRadio extends StatefulWidget {
  var selectedGender;

  RadioButtonUsingRadio({
    super.key,
    this.selectedGender,
  });

  @override
  State<RadioButtonUsingRadio> createState() => _RadioButtonUsingRadioState();
}

class _RadioButtonUsingRadioState extends State<RadioButtonUsingRadio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Please let us know your gender:'),
        ListTile(
          leading: Radio<String>(
            value: 'male',
            groupValue: widget.selectedGender,
            onChanged: (value) {
              setState(() {
                widget.selectedGender = value!;
              });
            },
          ),
          title: const Text('Male'),
        ),
        ListTile(
          leading: Radio<String>(
            value: 'female',
            groupValue: widget.selectedGender,
            onChanged: (value) {
              setState(() {
                widget.selectedGender = value!;
              });
            },
          ),
          title: const Text('Female'),
        ),
        const SizedBox(height: 15),
        Text(
            widget.selectedGender == 'male' ? 'Hello gentlement!' : 'Hi lady!'),
      ],
    );
  }
}
