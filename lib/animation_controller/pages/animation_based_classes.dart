import 'package:flutter/material.dart';

import '../components/product_home_page.dart';

class AnimationBasedClassesExamplePage extends StatefulWidget {
  const AnimationBasedClassesExamplePage({super.key, required this.title});

  final String title;

  @override
  State<AnimationBasedClassesExamplePage> createState() =>
      _AnimationBasedClassesExamplePageState();
}

class _AnimationBasedClassesExamplePageState
    extends State<AnimationBasedClassesExamplePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    controller.forward();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductHomePage(
          title: 'Product layout demo home page',
          animation: animation,
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
