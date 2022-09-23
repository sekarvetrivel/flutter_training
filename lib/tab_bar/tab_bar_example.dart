import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key, required this.title});

  final String title;

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  List<Tab> myTabs = <Tab>[
    Tab(icon: Icon(Icons.flight)),
    Tab(icon: Icon(Icons.directions_transit)),
    Tab(icon: Icon(Icons.directions_car)),
  ];
  TabBarView tabBarView = TabBarView(
    children: [
      Icon(
        Icons.flight,
        size: 350,
        color: Colors.blue,
      ),
      Icon(
        Icons.directions_transit,
        size: 350,
        color: Colors.blue,
      ),
      Icon(
        Icons.directions_car,
        size: 350,
        color: Colors.blue,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            indicator: BoxDecoration(
              color: Colors.greenAccent,
              image: DecorationImage(
                  image: AssetImage('assets/images/splash.png'),
                  fit: BoxFit.fitWidth),
              //borderRadius: BorderRadius.circular(50), // Creates border
            ),
            // indicatorColor: Colors.amberAccent,
            // indicatorSize: TabBarIndicatorSize.label,
            // indicatorWeight: 10,
            tabs: myTabs,
          ),
        ),
        body: tabBarView,
      ),
    );
  }
}
