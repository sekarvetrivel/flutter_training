import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/components/my_choice_clip.dart';
import 'package:flutter_training/widgets/components/my_stream_builder.dart';

import 'components/my_align.dart';
import 'components/my_aspect_ratio.dart';
import 'components/my_baseline.dart';
import 'components/my_center.dart';
import 'components/my_circular_progress_indicator_using_adaptive.dart';
import 'components/my_column.dart';
import 'components/my_constrained_box.dart';
import 'components/my_elevated_button.dart';
import 'components/my_fitted_box.dart';
import 'components/my_gesture_detector.dart';
import 'components/my_icon.dart';
import 'components/my_icon_using_adaptive.dart';
import 'components/my_image.dart';
import 'components/my_list_view.dart';
import 'components/my_overflow_box.dart';
import 'components/my_padding.dart';
import 'components/my_row.dart';
import 'components/my_search_delegate.dart';
import 'components/my_sized_box.dart';
import 'components/my_slider_using_adaptive.dart';
import 'components/my_sliver_app_bar.dart';
import 'components/my_stack.dart';
import 'components/my_stepper.dart';
import 'components/my_switch_list_tile_using_adaptive.dart';
import 'components/my_switch_using_adaptive.dart';
import 'components/my_text.dart';
import 'components/my_text_button.dart';
import 'components/my_text_field.dart';

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({super.key, required this.title});

  final String title;

  @override
  State<WidgetsPage> createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  @override
  Widget build(BuildContext context) {
    int currentStep = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            myText(),
            myElevatedButton(),
            myTextButton(),
            myTextField(),
            myListView(),
            myImage(),
            myIcon(),
            myColumn(),
            myRow(),
            myCenter(),
            myPadding(),
            myStack(),
            myAlign(),
            mySizedBox(),
            myAspectRatio(),
            myBaseline(),
            myConstrainedBox(),
            myFittedBox(),
            myOverflowBox(),
            MyStepper(),
            MySearchDelegate(),
            mySliderUsingAdaptive(),
            mySwitchListTileUsingAdaptive(),
            mySwitchUsingAdaptive(),
            myIconUsingAdaptive(),
            myCircularProgressIndicatorUsingAdaptive(),
            myGestureDetector(context),
            MyStreamBuilder(),
            MyChoiceChip(),
            mySliverAppBar(context),
          ]),
        ),
      ),
    );
  }
}

class Car extends StatefulWidget {
  final title;

  const Car({Key? key, this.title}) : super(key: key);

  @override
  _CarState createState() => _CarState();
}

class _CarState extends State<Car> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFEEFE),
      child: Container(
        child: Container(//child: Container() )
            ),
      ),
    );
  }
}

class MyStatelessCarWidget extends StatelessWidget {
  const MyStatelessCarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFEEFE));
  }
}
