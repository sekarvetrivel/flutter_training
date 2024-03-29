import 'package:flutter/material.dart';
import 'package:flutter_pinned_shortcut/flutter_pinned_shortcut.dart';
import 'package:flutter_shortcuts/flutter_shortcuts.dart';

import '../custom_cupertino_date_picker/CustomCupertinoDatePicker.dart';
import '../slider/slider_example.dart';

class PinnedShortcutPage extends StatefulWidget {
  @override
  _PinnedShortcutPageState createState() => _PinnedShortcutPageState();
}

class _PinnedShortcutPageState extends State<PinnedShortcutPage> {
  String action = 'No Action';
  final FlutterShortcuts flutterShortcuts = FlutterShortcuts();
  int? maxLimit;
  final FlutterPinnedShortcut flutterPinnedShortcutPlugin =
      FlutterPinnedShortcut();
  late final DateTime _minDate;
  late final DateTime _maxDate;
  late DateTime _selecteDate;

  @override
  void initState() {
    super.initState();
    final currentDate = DateTime.now();
    _minDate = DateTime(
      currentDate.year - 100,
      currentDate.month,
      currentDate.day,
    );
    _maxDate = DateTime(
      currentDate.year - 18,
      currentDate.month,
      currentDate.day,
    );
    _selecteDate = _maxDate;
    flutterShortcuts.initialize(debug: true);
    flutterShortcuts.listenAction((String incomingAction) {
      setState(() {
        action = incomingAction;
      });
    });
  }

  void addPinnedShortcut() {
    print("sekar test");
    flutterPinnedShortcutPlugin.createPinnedShortcut(
        id: "1",
        label: "Followers",
        action: "followers",
        iconAssetName: "assets/images/Google.png");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Shortcuts Plugin'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pinned Shortcuts"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text("Set pinned Shortcut"),
                      onPressed: () async {
                        addPinnedShortcut();
                      },
                    ),
                  ],
                ),
                SwipeOnOffButton(
                  onConfirmation: () {},
                ),
                SizedBox(
                  height: 300,
                  child: CustomCupertinoDatePicker(
                    itemExtent: 50,
                    minDate: _minDate,
                    maxDate: _maxDate,
                    selectedDate: _selecteDate,
                    selectionOverlay: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                          horizontal: BorderSide(color: Colors.grey, width: 1),
                        ),
                      ),
                    ),
                    selectedStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                    unselectedStyle: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                    ),
                    disabledStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 18,
                    ),
                    onSelectedItemChanged: (date) => _selecteDate = date,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
