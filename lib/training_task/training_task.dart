import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../zodeak_x/pages/market_screen/market_view_model.dart';
import 'on_boarding_screen/screen_one.dart';

class TrainingTask extends StatelessWidget {
  const TrainingTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getAllProviers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Training Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TrainingTaskPage(title: 'Training Task'),
      ),
    );
  }
}

getAllProviers() {
  return [
    ChangeNotifierProvider(create: (_) => MarketViewModel()),
  ];
}

class TrainingTaskPage extends StatefulWidget {
  const TrainingTaskPage({super.key, required this.title});

  final String title;

  @override
  State<TrainingTaskPage> createState() => _TrainingTaskPageState();
}

class _TrainingTaskPageState extends State<TrainingTaskPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: OnboardingScreenOne(),
    );
  }
}
