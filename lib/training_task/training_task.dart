import 'package:flutter/material.dart';
import 'package:flutter_training/training_task/on_boarding_screen/view_model/on_boarding_view_model.dart';
import 'package:flutter_training/training_task/widgets/custom_scaffold.dart';
import 'package:provider/provider.dart';

import 'on_boarding_screen/view/on_boarding_screen.dart';

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

class TrainingTaskPage extends StatefulWidget {
  const TrainingTaskPage({super.key, required this.title});

  final String title;

  @override
  State<TrainingTaskPage> createState() => _TrainingTaskPageState();
}

getAllProviers() {
  return [
    ChangeNotifierProvider(create: (_) => OnBoardingViewModel()),
  ];
}

class _TrainingTaskPageState extends State<TrainingTaskPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: OnboardingScreen(),
    );
  }
}
