import 'package:flutter/material.dart';

class DefaultTabControllerExamplePage extends StatefulWidget {
  const DefaultTabControllerExamplePage({super.key, required this.title});

  final String title;

  @override
  State<DefaultTabControllerExamplePage> createState() =>
      _DefaultTabControllerExamplePageState();
}

const List<Tab> tabs = <Tab>[
  Tab(text: 'Zeroth'),
  Tab(text: 'First'),
  Tab(text: 'Second'),
];

class _DefaultTabControllerExamplePageState
    extends State<DefaultTabControllerExamplePage> {
  @override
  Widget build(BuildContext context) {
    return MyDefaultTabController(
      title: widget.title,
    );
  }
}

class MyDefaultTabController extends StatelessWidget {
  final title;

  MyDefaultTabController({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          appBar: AppBar(
            title: Text(this.title),
            bottom: const TabBar(
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            children: tabs.map((Tab tab) {
              return Center(
                child: Text(
                  '${tab.text!} Tab',
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
