import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../networking/graphql/exception/handle_response.dart';
import '../../repository/zodeak_x_repository.dart';
import 'market_model.dart';

class MarketViewModel extends ChangeNotifier {
  MarketViewModel? viewModel;
  List<ListOfTradePairs>? viewModelTradePairs;

  MarketViewModel() {
    getTradePairs();
  }

  bool passwordVisible = false;

  void changeIcon() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  String passwordValue = "false";
  int clickCount = 0;

  void changePassword() {
    if (clickCount > 1) {
      passwordValue = passwordValue == "true" ? "false" : "true";
      clickCount = 0;
    }
    clickCount++;
    notifyListeners();
  }

  setTradePairs(List<ListOfTradePairs>? tradePairs) {
    viewModelTradePairs = tradePairs;
    notifyListeners();
  }

  getTradePairs() async {
    var response = await zodeakXRepository.fetchTradePairs();
    var decodeResponse = HandleResponse.completed(response);
    switch (decodeResponse.status?.index) {
      case 0:
        break;
      case 1:
        setTradePairs(decodeResponse.data?.result);
        break;
      default:
        break;
    }
  }
}
