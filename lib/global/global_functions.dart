import 'package:flutter/material.dart';
import 'package:fluttertraining/absorb_pointer/absorb_pointer_example.dart';
import 'package:fluttertraining/calculator/calculator_example.dart';
import 'package:fluttertraining/complex_ui/complex_ui_example.dart';
import 'package:fluttertraining/custom_dialog/custom_dialog_example.dart';
import 'package:fluttertraining/custom_scroll/custom_scroll_example.dart';
import 'package:fluttertraining/hive/pages/info_screen.dart';
import 'package:fluttertraining/notification/notification_example.dart';
import 'package:fluttertraining/paypal/paypal_example.dart';
import 'package:fluttertraining/paypal_product/paypal_product_example.dart';
import 'package:fluttertraining/radial_hero/radial_hero_example.dart';
import 'package:fluttertraining/radio_button/radio_button_example.dart';
import 'package:fluttertraining/screen_util/screen_util_example.dart';
import 'package:fluttertraining/shake_animation/shake_animation_example.dart';
import 'package:fluttertraining/slidable_list_items/slidable_list_items_example.dart';
import 'package:fluttertraining/snackbar/snackbar_example.dart';
import 'package:fluttertraining/tab_bar/tab_bar_example.dart';
import 'package:fluttertraining/tab_controller/tab_controller_example.dart';
import 'package:fluttertraining/training_task/training_task.dart';
import 'package:fluttertraining/zodeak_x/zodeak_x_example.dart';

import '../alertdialog/alertdialog_example.dart';
import '../animated_container/animated_container_example.dart';
import '../animation_controller/animation_controller_example.dart';
import '../aspect_ratio/aspect_ratio_example.dart';
import '../asset_bundle/asset_bundle_example.dart';
import '../baseline/baseline_example.dart';
import '../buttons/buttons_example.dart';
import '../card/card_example.dart';
import '../column/column_example.dart';
import '../container/container_example.dart';
import '../country_state_city_picker/CountryStateCityPickerExample.dart';
import '../divider/divider_example.dart';
import '../drawer/drawer_example.dart';
import '../icons/icons_example.dart';
import '../list_view_and_list_tile/list_view_example.dart';
import '../load_more/load_more_example.dart';
import '../scaffold/scaffold_example.dart';
import '../slider/slider_example.dart';
import '../text/text_example.dart';
import '../text_field/text_field_example.dart';
import '../widgets/widgets_example.dart';

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
    case 7:
      navigatorHelper(
        context,
        AlertdialogPage(title: "AlertDialog"),
      );
      break;
    case 8:
      navigatorHelper(
        context,
        AssetBundlePage(title: "AssetBundle"),
      );
      break;
    case 9:
      navigatorHelper(
        context,
        AspectRatioPage(title: "AspectRatio"),
      );
      break;
    case 10:
      navigatorHelper(
        context,
        AnimationControllerPage(title: "AnimationController"),
      );
      break;
    case 11:
      navigatorHelper(
        context,
        IconsPage(title: "Icons"),
      );
      break;
    case 12:
      navigatorHelper(
        context,
        ButtonsPage(title: "Buttons"),
      );
      break;
    case 13:
      navigatorHelper(
        context,
        AnimatedContainerPage(title: "Animated Container"),
      );
      break;
    case 14:
      navigatorHelper(
        context,
        TextFieldPage(title: "TextField"),
      );
      break;
    case 15:
      navigatorHelper(
        context,
        TextPage(title: "Text"),
      );
      break;
    case 16:
      navigatorHelper(
        context,
        ScaffoldPage(title: "Scaffold"),
      );
      break;
    case 17:
      navigatorHelper(
        context,
        CSCPickerPage(title: "CSCPicker"),
      );
      break;
    case 18:
      navigatorHelper(
        context,
        WidgetsPage(title: "Widgets"),
      );
      break;
    case 19:
      navigatorHelper(
        context,
        LoadMorePage(title: "Load More"),
      );
      break;
    case 20:
      navigatorHelper(
        context,
        TabControllerPage(title: "Tab Controller"),
      );
      break;
    case 21:
      navigatorHelper(
        context,
        TabBarPage(title: "Tab Bar"),
      );
      break;
    case 22:
      navigatorHelper(
        context,
        SnackbarPage(title: "SnackBar"),
      );
      break;
    case 23:
      navigatorHelper(
        context,
        RadioButtonPage(title: "RadioButton"),
      );
      break;
    case 24:
      navigatorHelper(
        context,
        ZodeakX(),
      );
      break;
    case 25:
      navigatorHelper(
        context,
        TrainingTask(),
      );
      break;
    case 26:
      navigatorHelper(
        context,
        InfoScreen(),
      );
      break;
    case 27:
      navigatorHelper(
        context,
        AbsorbPointerPage(title: "AbsorbPointer"),
      );
      break;
    case 28:
      navigatorHelper(
        context,
        CustomScrollPage(title: "Custom Scroll"),
      );
      break;
    case 29:
      navigatorHelper(
        context,
        ComplexUIPage(title: "Complex UI"),
      );
      break;
    case 30:
      navigatorHelper(
        context,
        RadialHeroPage(),
      );
      break;
    case 31:
      navigatorHelper(
        context,
        CalculatorPage(title: "Calculator"),
      );
      break;
    case 32:
      navigatorHelper(
        context,
        CustomDialogPage(title: "Custom Dialog"),
      );
      break;
    case 33:
      navigatorHelper(
        context,
        SlidableListPage(title: "Slidable List Items"),
      );
      break;
    case 34:
      navigatorHelper(
        context,
        SwipeOnOffButton(
          onConfirmation: () {},
        ),
      );
      break;
    case 35:
      navigatorHelper(
        context,
        ScreenUtilPage(title: "Slidable Util"),
      );
      break;
    case 36:
      navigatorHelper(
        context,
        ShakeAnimationPage(title: "Shake Animation"),
      );
      break;
    case 37:
      navigatorHelper(
        context,
        PaypalProductPage(
          title: "Paypal",
        ),
      );
      break;
    case 38:
      navigatorHelper(
        context,
        NotificationPage(
          title: "Notification",
        ),
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

mySnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}
