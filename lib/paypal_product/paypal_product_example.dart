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
  var checkoutUrl;

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
      final request = BraintreeDropInRequest(
        clientToken: viewModel.braintreeClientToken!.clientToken,
        collectDeviceData: true,
        paypalRequest: BraintreePayPalRequest(
          amount: '10.20',
          displayName: 'Example company',
        ),
      );

      checkoutUrl =
          "https://www.sandbox.paypal.com/checkoutnow?sessionID=uid_d1c205a3ba_mtq6mtc6ntk&buttonSessionID=uid_33460ff87c_mtq6mtg6mdk&stickinessID=uid_45ad2e8e45_mtm6mdq6mda&inlinexo=false&smokeHash=&fundingSource=paypal&buyerCountry=IN&locale.x=en_GB&commit=true&standaloneFundingSource=paypal&branded=true&clientID=${viewModel.braintreeClientToken!.clientToken}&env=sandbox&sdkMeta=eyJ1cmwiOiJodHRwczovL3d3dy5wYXlwYWwuY29tL3Nkay9qcz9jb21wb25lbnRzPWJ1dHRvbnMmY3VycmVuY3k9RVVSJmludGVudD1jYXB0dXJlJmNsaWVudC1pZD1BWjc0RjZBV0lyVExEQkpxM19MUkx0YWpwVDk5ZW93eVJXdkhEZWtUZXIzMGhnWGszUDBWQ1hJcVBiU2s0aFFsYzBMTXVla25MY1hLd2szOCIsImF0dHJzIjp7ImRhdGEtdWlkIjoidWlkX2VtaHZ4eHFneXF4aGh2YWlza3p6eGxkeGdrZHh4ciJ9fQ&xcomponent=1&version=5.0.350&token=EC-76A61188A5109493E";
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
                BraintreePayPalRequest? result = BraintreePayPalRequest(
                  amount: "10",
                  billingAgreementDescription: "none",
                  currencyCode: "USD",
                  displayName: 'Example company',
                );
                if (result != null) {
                  print('Nonce: ${result.amount}');
                } else {
                  print('Selection was canceled.');
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
