import 'package:flutter/material.dart';

Widget mySwitchListTileUsingAdaptive() {
  return SwitchListTile.adaptive(
      title: Text("Switch List Tile"), value: true, onChanged: (bool value) {});
}