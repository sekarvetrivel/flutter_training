import 'package:flutter/material.dart';
import 'package:flutter_training/buttons/components/my_choice_card.dart';

import 'components/my_switch_screen.dart';

class ButtonsPage extends StatefulWidget {
  const ButtonsPage({super.key, required this.title});

  final String title;

  @override
  State<ButtonsPage> createState() => _ButtonsPageState();
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

class Choice {
  const Choice({required this.name, required this.icon});

  final String name;
  final IconData icon;
}

List<Choice> choices = const <Choice>[
  const Choice(name: 'Open', icon: Icons.file_open_outlined),
  const Choice(name: 'Load', icon: Icons.upload),
  const Choice(name: 'Save', icon: Icons.save_outlined),
  const Choice(name: 'Exit', icon: Icons.exit_to_app),
];

class _ButtonsPageState extends State<ButtonsPage> {
  final ButtonStyle textButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  final ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  double _speakervolume = 0.0;
  int _volume = 0;

  List<ListItem> _dropdownItems = [
    ListItem(1, "Choice 1"),
    ListItem(2, "Choice 2"),
    ListItem(3, "Choice 3"),
    ListItem(4, "Choice 4")
  ];

  late List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  late ListItem _itemSelected;

  Choice _selectedOption = choices[0];
  final isSelected = <bool>[false, false, false];
  bool currentlySelected = false;

  void _select(Choice choice) {
    setState(() {
      _selectedOption = choice;
    });
  }

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _itemSelected = _dropdownMenuItems[1].value!;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    outlinedButtonStyle.copyWith(
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed))
            return BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            );
          return BorderSide();
        },
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.skip(0).map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.name),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {},
                child: Text("TextButton"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("TextButton with Themed"),
                style: textButtonStyle,
              ),
              ElevatedButton(onPressed: () {}, child: Text("ElevatedButton")),
              ElevatedButton(
                onPressed: () {},
                child: Text("ElevatedButton with Themed"),
                style: elevatedButtonStyle,
              ),
              OutlinedButton(onPressed: () {}, child: Text("OutlinedButton")),
              OutlinedButton(
                onPressed: () {},
                child: Text("OutlinedButton"),
                style: outlinedButtonStyle,
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.focused))
                      return Colors.brown;
                    if (states.contains(MaterialState.hovered))
                      return Colors.black;
                    if (states.contains(MaterialState.pressed))
                      return Colors.white;
                    return null; // Defer to the widget's default.
                  }),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.focused))
                      return Colors.red;
                    if (states.contains(MaterialState.hovered))
                      return Colors.green;
                    if (states.contains(MaterialState.pressed))
                      return Colors.blue;
                    return null; // Defer to the widget's default.
                  }),
                ),
                onPressed: () {},
                child: Text('TextButton with custom overlay colors'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(onSurface: Colors.red),
                onPressed: null,
                child: Text('ElevatedButton with custom disabled colors'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled))
                      return Colors.red;
                    return null; // Defer to the widget's default.
                  }),
                  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled))
                      return Colors.black;
                    return null; // Defer to the widget's default.
                  }),
                ),
                onPressed: null,
                child: Text('ElevatedButton with custom disabled colors'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 10),
                onPressed: () {},
                child: Text('ElevatedButton with custom elevations'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith<double?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) return 16;
                    return null;
                  }),
                ),
                onPressed: () {},
                child: Text('ElevatedButton with a custom elevation'),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: StadiumBorder(),
                  side: BorderSide(width: 2, color: Colors.red),
                ),
                onPressed: () {},
                child: Text('OutlinedButton with custom shape and border'),
              ),
              OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      StadiumBorder()),
                  side: MaterialStateProperty.resolveWith<BorderSide>(
                      (Set<MaterialState> states) {
                    final Color color = states.contains(MaterialState.pressed)
                        ? Colors.blue
                        : Colors.red;
                    return BorderSide(color: color, width: 2);
                  }),
                ),
                onPressed: () {},
                child: Text('OutlinedButton with custom shape and border'),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.black),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            style: new TextStyle(
                              color: Colors.black,
                            ),
                            value: _itemSelected,
                            items: _dropdownMenuItems,
                            onChanged: (value) {
                              setState(() {
                                _itemSelected = value!;
                              });
                            }),
                      ),
                    ),
                  ),
                  Text("We have selected ${_itemSelected.name}"),
                ],
              ),
              IconButton(
                  icon: Icon(Icons.volume_up),
                  iconSize: 50,
                  color: Colors.brown,
                  tooltip: 'Increase volume by 5',
                  onPressed: () {
                    setState(() {
                      _speakervolume += 5;
                    });
                  }),
              Text('Speaker Volume: $_speakervolume'),
              InkWell(
                splashColor: Colors.green,
                highlightColor: Colors.blue,
                child: Icon(Icons.ring_volume, size: 50),
                onTap: () {
                  setState(() {
                    _volume += 2;
                  });
                },
              ),
              Text(_volume.toString(), style: TextStyle(fontSize: 25)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MyChoiceCard(choice: _selectedOption),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: new ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      child: new Text('Javatpoint'),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        /** */
                      },
                    ),
                    TextButton(
                      child: Text('Flutter'),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        /** */
                      },
                    ),
                    TextButton(
                      child: Text('MySQL'),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        /** */
                      },
                    ),
                  ],
                ),
              ),
              ToggleButtons(
                color: Colors.black.withOpacity(0.60),
                selectedColor: Colors.blue,
                selectedBorderColor: Colors.blue,
                fillColor: Colors.blue.withOpacity(0.08),
                splashColor: Colors.blue.withOpacity(0.12),
                hoverColor: Colors.blue.withOpacity(0.04),
                borderRadius: BorderRadius.circular(4.0),
                constraints: BoxConstraints(minHeight: 36.0),
                isSelected: isSelected,
                onPressed: (index) {
                  // Respond to button selection
                  setState(() {
                    isSelected[index] = !isSelected[index];
                  });
                },
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('BUTTON 1'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('BUTTON 2'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('BUTTON 3'),
                  ),
                ],
              ),
              Center(child: MySwitchScreen()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: () => {},
      ),
    );
  }
}
