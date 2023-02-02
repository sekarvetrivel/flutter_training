import 'package:flutter/material.dart';
import 'package:fluttertraining/paypal_product/view_model/paypal_product_view_model.dart';
import 'package:fluttertraining/training_task/home_screen/view_model/home_view_model.dart';
import 'package:fluttertraining/training_task/on_boarding_screen/view_model/on_boarding_view_model.dart';
import 'package:fluttertraining/training_task/widgets/custom_scaffold.dart';
import 'package:provider/provider.dart';

import 'login_screen/view_model/login_view_model.dart';
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
        theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Color(0xff5376a5),
              ),
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
    ChangeNotifierProvider(
      create: (_) => OnBoardingViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => PaypalProductViewModel(),
    ),
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
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: OnboardingScreen(),
    );
  }
}
