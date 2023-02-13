import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:fluttertraining/paypal_product/view_model/paypal_product_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../main.dart';

class PaypalProductPage extends StatefulWidget {
  const PaypalProductPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<PaypalProductPage> createState() => _PaypalProductPageState();
}

class _PaypalProductPageState extends State<PaypalProductPage>
    with TickerProviderStateMixin {
  late PaypalProductViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = Provider.of<PaypalProductViewModel>(
        NavigationService.navigatorKey.currentContext!,
        listen: false);
    viewModel.getBraintreeToken();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = context.watch<PaypalProductViewModel>();
    if (viewModel.braintreeClientToken != null) {
      final request = BraintreePayPalRequest(
        billingAgreementDescription:
            'I hereby agree that flutter_braintree is great.',
      );
      return Provider(
        create: (BuildContext context) => viewModel,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).backgroundColor,
              leading: GestureDetector(
                child: Icon(Icons.arrow_back_ios),
                onTap: () => Navigator.pop(context),
              ),
            ),
            body: ElevatedButton(
              child: Text("pay"),
              onPressed: () async {
                BraintreePaymentMethodNonce? result =
                    await Braintree.requestPaypalNonce(
                  viewModel.braintreeClientToken!.clientToken.toString(),
                  request,
                );
                if (result != null) {
                  print('Nonce: ${result.nonce}');
                } else {
                  print('PayPal flow was canceled.');
                }
              },
            )),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.black12,
          elevation: 0.0,
        ),
        body: Center(child: Container(child: CircularProgressIndicator())),
      );
    }
  }

  // for executing the payment transaction
  Future<String> executePayment(accessToken) async {
    try {
      var response = await http.get(
          Uri.parse(
              "https://api-m.sandbox.paypal.com/v1/payments/payment?count=10&start_index=0&sort_by=create_time&sort_order=desc"),
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer ' + accessToken
          });

      final body = convert.jsonDecode(response.body);
      print("response - ${response.statusCode}");
      if (response.statusCode == 200) {
        return body["id"];
      }
      return "";
    } catch (e) {
      rethrow;
    }
  }
}
