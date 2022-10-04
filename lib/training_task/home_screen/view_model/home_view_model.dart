import 'package:flutter/material.dart';

import '../../../zodeak_x/networking/graphql/exception/handle_response.dart';
import '../../../zodeak_x/pages/market_screen/market_model.dart';
import '../../../zodeak_x/repository/zodeak_x_repository.dart';

class HomeViewModel extends ChangeNotifier {
  List<ListOfTradePairs>? viewModelTradePairs;
  bool switchView = false;

  void changeView(String type) {
    if (type == "stream")
      switchView = true;
    else
      switchView = false;
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
