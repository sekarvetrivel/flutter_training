import 'package:flutter/material.dart';

import 'components/home_item_card.dart';
import 'components/my_list_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Training',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Training'),
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
  ];
  List<Widget> drawerChildren = [];

  @override
  void initState() {
    super.initState();
    this.drawerChildren = createDrawerChildren();
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
          itemBuilder: (BuildContext context, int index) {
            return HomeItemCard(
              items: items,
              index: index,
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
