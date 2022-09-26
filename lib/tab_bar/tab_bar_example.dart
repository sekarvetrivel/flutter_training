import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key, required this.title});

  final String title;

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with TickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: myTabs.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  List<Tab> myTabs = <Tab>[
    Tab(icon: Icon(Icons.flight)),
    Tab(icon: Icon(Icons.directions_transit)),
    Tab(icon: Icon(Icons.directions_car)),
    Tab(icon: Icon(Icons.bike_scooter)),
    Tab(icon: Icon(Icons.directions_walk)),
    Tab(icon: Icon(Icons.bus_alert)),
    Tab(icon: Icon(Icons.local_shipping)),
    Tab(icon: Icon(Icons.airport_shuttle)),
    Tab(icon: Icon(Icons.anchor)),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                title: Text(widget.title),
                bottom: TabBar(
                  controller: _controller,
                  isScrollable: true,
                  indicator: ShapeDecoration(
                    color: Colors.blue,
                    shape: Border.all(
                          color: Colors.red,
                          width: 3.0,
                        ) +
                        Border.all(
                          color: Colors.green,
                          width: 3.0,
                        ) +
                        Border.all(
                          color: Colors.amber,
                          width: 3.0,
                        ),
                  ),
                  // indicator: BoxDecoration(
                  //   color: Colors.greenAccent,
                  //   image: DecorationImage(
                  //       image: AssetImage('assets/images/splash.png'),
                  //       fit: BoxFit.fitWidth),
                  //   //borderRadius: BorderRadius.circular(50), // Creates border
                  // ),
                  // indicatorColor: Colors.amberAccent,
                  // indicatorSize: TabBarIndicatorSize.label,
                  // indicatorWeight: 10,
                  tabs: myTabs,
                ),
              ),
            ];
          },
          body: tabBarView(_controller),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward_ios),
          onPressed: () {
            _controller.animateTo(_selectedIndex += 1);
          },
        ),
      ),
    );
  }
}

Widget tabBarView(TabController _controller) {
  return TabBarView(
    controller: _controller,
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
      Icon(
        Icons.bike_scooter,
        size: 350,
        color: Colors.blue,
      ),
      Icon(
        Icons.directions_walk,
        size: 350,
        color: Colors.blue,
      ),
      Icon(
        Icons.bus_alert,
        size: 350,
        color: Colors.blue,
      ),
      Icon(
        Icons.local_shipping,
        size: 350,
        color: Colors.blue,
      ),
      Icon(
        Icons.airport_shuttle,
        size: 350,
        color: Colors.blue,
      ),
      Icon(
        Icons.anchor,
        size: 350,
        color: Colors.blue,
      ),
    ],
  );
}
