import 'package:flutter/material.dart';

enum Pet { dog, cat }

class StyledRadioButtonExample extends StatefulWidget {
  const StyledRadioButtonExample({Key? key}) : super(key: key);

  @override
  State<StyledRadioButtonExample> createState() =>
      _StyledRadioButtonExampleState();
}

class _StyledRadioButtonExampleState extends State<StyledRadioButtonExample> {
  Pet _pet = Pet.dog;

  int? _groupValue1;
  int? _groupValue2;
  int? _groupValue3;
  int? _groupValue4;
  int? _groupValue5;
  int? _groupValue6;

  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    _focusNodes = Iterable<int>.generate(3).map((e) => FocusNode()).toList();

    _focusNodes[0].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Dog'),
          leading: Radio<Pet>(
            fillColor: MaterialStateColor.resolveWith((states) => Colors.green),
            focusColor:
                MaterialStateColor.resolveWith((states) => Colors.green),
            value: Pet.dog,
            groupValue: _pet,
            onChanged: (Pet? value) {
              setState(() {
                _pet = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Cart'),
          leading: Radio<Pet>(
            fillColor: MaterialStateColor.resolveWith((states) => Colors.green),
            focusColor:
                MaterialStateColor.resolveWith((states) => Colors.green),
            value: Pet.cat,
            groupValue: _pet,
            onChanged: (Pet? value) {
              setState(() {
                _pet = value!;
              });
            },
          ),
        ),
        Column(
          children: [
            _buildItem1("One", 1),
            _buildItem1("Two", 2),
            _buildItem1("Three", 3),
          ],
        ),
        Column(
          children: [
            _buildItem2("One", 1),
            _buildItem2("Two", 2),
            _buildItem2("Three", 3),
          ],
        ),
        Column(
          children: [
            _buildItem3("One", 1),
            _buildItem3("Two", 2),
            _buildItem3("Three", 3),
          ],
        ),
        Column(
          children: [
            _buildItem4("One", 1),
            _buildItem4("Two", 2),
            _buildItem4("Three", 3),
          ],
        ),
        Column(
          children: [
            _buildItem5("One", 1),
            _buildItem5("Two", 2),
            _buildItem5("Three", 3),
          ],
        ),
        Column(
          children: [
            _buildItem6("One", 1, _focusNodes[0]),
            _buildItem6("Two", 2, _focusNodes[1]),
            _buildItem6("Three", 3, _focusNodes[2]),
          ],
        )
      ],
    );
  }

  Widget _buildItem1(String text, int value) {
    return RadioListTile(
      title: Text(text),
      groupValue: _groupValue1,
      value: value,
      onChanged: (int? value) {
        setState(() {
          _groupValue1 = value;
        });
      },
      tileColor: Colors.yellow,
      activeColor: Colors.pink,
      selectedTileColor: Colors.purple,
      // other arguments
    );
  }

  Widget _buildItem2(String text, int value) {
    return RadioListTile(
      title: Text(text),
      groupValue: _groupValue2,
      value: value,
      onChanged: (int? value) {
        setState(() {
          _groupValue2 = value;
        });
      },
      activeColor: Colors.pink,
      selectedTileColor: Colors.purple,
      tileColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.orange;
        } else if (states.contains(MaterialState.selected)) {
          return Colors.teal;
        }
        if (states.contains(MaterialState.focused)) {
          return Colors.blue;
        } else {
          return Colors.black12;
        }
      }),
      // other arguments
    );
  }

  Widget _buildItem3(String text, int value) {
    return RadioListTile(
      title: Text(text),
      groupValue: _groupValue3,
      value: value,
      onChanged: (int? value) {
        setState(() {
          _groupValue3 = value;
        });
      },
      activeColor: Colors.pink,
      selectedTileColor: Colors.purple,
      tileColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.lightGreenAccent;
        }
        if (states.contains(MaterialState.focused)) {
          return Colors.brown;
        } else {
          return Colors.white;
        }
      }),
      // other arguments
    );
  }

  Widget _buildItem4(String text, int value) {
    return RadioListTile(
      title: Text(text),
      groupValue: _groupValue4,
      value: value,
      onChanged: (int? value) {
        setState(() {
          _groupValue4 = value;
        });
      },
      toggleable: true,
      // other arguments
    );
  }

  Widget _buildItem5(String text, int value) {
    return ListTile(
      title: Text(text),
      leading: Radio<int>(
        groupValue: _groupValue5,
        value: value,
        onChanged: (int? value) {
          setState(() {
            _groupValue5 = value;
          });
        },
      ),
      visualDensity: VisualDensity.compact,
      // other arguments
    );
  }

  Widget _buildItem6(String text, int value, FocusNode focusNode) {
    return RadioListTile(
      title: Text(text),
      groupValue: _groupValue6,
      value: value,
      onChanged: (int? value) {
        setState(() {
          _groupValue6 = value;
        });
      },
      focusNode: focusNode,
      // other arguments
    );
  }
}
