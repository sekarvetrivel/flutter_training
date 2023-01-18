import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../training_task/home_screen/view_model/home_view_model.dart';

class FullScreenModal extends ModalRoute {
  late HomeViewModel viewModel;

  FullScreenModal() {
    viewModel = Provider.of<HomeViewModel>(
        NavigationService.navigatorKey.currentContext!,
        listen: false);
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.6);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  int selectedOrder = 0;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    viewModel = context.watch<HomeViewModel>();
    return Provider(
      create: (BuildContext context) => viewModel,
      child: Material(
        type: MaterialType.transparency,
        child: SafeArea(
          child: Stack(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.pop(context, selectedOrder);
                },
              ),
              IgnorePointer(
                ignoring: false,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.blue,
                        child: CupertinoSwitch(
                          value: viewModel.switchValue,
                          onChanged: (value) {
                            viewModel.setSwitch();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // add fade animation
    return FadeTransition(
      opacity: animation,
      // add slide animation
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
