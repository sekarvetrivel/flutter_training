import 'package:flutter/material.dart';
import 'package:flutter_pinned_shortcut/flutter_pinned_shortcut.dart';
import 'package:flutter_shortcuts/flutter_shortcuts.dart';

class PinnedShortcutPage extends StatefulWidget {
  @override
  _PinnedShortcutPageState createState() => _PinnedShortcutPageState();
}

class _PinnedShortcutPageState extends State<PinnedShortcutPage> {
  String action = 'No Action';
  final FlutterShortcuts flutterShortcuts = FlutterShortcuts();
  int? maxLimit;
  final FlutterPinnedShortcut flutterPinnedShortcutPlugin = FlutterPinnedShortcut();

  @override
  void initState() {
    super.initState();
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
        iconAssetName: "assets/images/Google.png"
    );
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}