import 'package:flutter/material.dart';
import 'package:flutter_training/baseline/baseline_example.dart';

import '../card/card_example.dart';
import '../column/column_example.dart';
import '../container/container_example.dart';
import '../divider/divider_example.dart';
import '../drawer/drawer_example.dart';
import '../list_view_and_list_tile/list_view_example.dart';

navigateTo(BuildContext context, int index) {
  switch (index) {
    case 0:
      navigatorHelper(
        context,
        ListViewPage(title: "ListView"),
      );
      break;
    case 1:
      navigatorHelper(
        context,
        DrawerPage(title: "Drawer"),
      );
      break;
    case 2:
      navigatorHelper(
        context,
        DividerPage(title: "Divider"),
      );
      break;
    case 3:
      navigatorHelper(
        context,
        ContainerPage(title: "Container"),
      );
      break;
    case 4:
      navigatorHelper(
        context,
        ColumnPage(title: "Column"),
      );
      break;
    case 5:
      navigatorHelper(
        context,
        CardPage(title: "Card"),
      );
      break;
    case 6:
      navigatorHelper(
        context,
        BaselinePage(title: "Baseline"),
      );
      break;
  }
}

navigatorHelper(BuildContext context, route) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => route),
  );
}

navigateToPageSTFull(BuildContext context, StatefulWidget statefulWidget) {
  navigatorHelper(
    context,
    statefulWidget,
  );
}

navigateToPageSTLess(BuildContext context, StatelessWidget statelessWidget) {
  navigatorHelper(
    context,
    statelessWidget,
  );
}
