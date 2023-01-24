import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_training/hive/model/people.dart';
import 'package:flutter_training/training_task/training_task.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'home/components/home_item_card.dart';
import 'home/components/my_list_tile.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PeopleAdapter());
  await Hive.openBox('peopleBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getAllProviers(),
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Training',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Training'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = [
    "ListView",
    "Drawer",
    "Divider",
    "Container",
    "Column",
    "Card",
    "Baseline",
    "Alertdialog",
    "AssetBundle",
    "AspectRatio",
    "Animation Controller",
    "Icons",
    "Buttons",
    "Animated Container",
    "TextField",
    "Text",
    "Scaffold",
    "Country City State",
    "Widgets",
    "Load More",
    "Tab Controller",
    "Tab Bar",
    "SnackBar",
    "RadioButton",
    "ZodeakX",
    "Training Task",
    "Hive",
    "AbsorbPointer",
    "Custom Scroll",
    "Complex UI",
    "Radial Hero",
    "Calculator",
    "Custom Dialog",
    "Slidable List",
    "Slider Button",
    "Screen Util",
  ];

  List<Color> colorList = [];
  List<Widget> drawerChildren = [];

  @override
  void initState() {
    super.initState();
    print("init");
    this.drawerChildren = createDrawerChildren();
    getColors();
  }

  getColors() {
    for (int i = 0; i < items.length; i++) {
      colorList.add(getColor());
    }
  }

  Color getColor() {
    return Color.fromARGB(
      255,
      math.Random().nextInt(256),
      math.Random().nextInt(256),
      math.Random().nextInt(256),
    );
  }

  List<Widget> createDrawerChildren() {
    List<Widget> children = [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text(
          'Flutter Training',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ];
    for (var i = 0; i < items.length; i++) {
      children.add(MyListTile(
        items: items,
        index: i,
      ));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    print("home");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 4, mainAxisSpacing: 4, crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return HomeItemCard(
              items: items,
              index: index,
              colors: colorList,
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: this.drawerChildren,
        ),
      ),
    );
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}