import 'package:flutter/material.dart';

import '../../../zodeak_x/networking/graphql/exception/handle_response.dart';
import '../../../zodeak_x/repository/zodeak_x_repository.dart';
import '../model/braintree_client_token.dart';

class PaypalProductViewModel extends ChangeNotifier {
  BraintreeClientToken? braintreeClientToken;

  setBraintreeToken(BraintreeClientToken? braintreeToken) {
    braintreeClientToken = braintreeToken;
    notifyListeners();
  }

  getBraintreeToken() async {
    var response = await zodeakXRepository.fetchBraintreeClientToken();
    var decodeResponse = HandleResponse.completed(response);
    switch (decodeResponse.status?.index) {
      case 0:
        break;
      case 1:
        setBraintreeToken(decodeResponse.data?.result);
        break;
      default:
        break;
    }
  }
}
