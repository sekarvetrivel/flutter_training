import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OnBoardingViewModel extends ChangeNotifier {
  int indicatorPosition = 0;

  void updateIndicatorPosition(int pos) {
    indicatorPosition = pos;
    notifyListeners();
  }
}
