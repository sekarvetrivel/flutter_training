import 'dart:async';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:http_auth/http_auth.dart';

class PaypalServices {
  String domain = "https://api-m.sandbox.paypal.com"; // for sandbox mode
//  String domain = "https://api.paypal.com"; // for production mode

  // change clientId and secret with your own, provided by paypal
  String clientId =
      'AbZqxwGM87-fRHI-HnG_plBoz-Z_j2OgcAKRFQzgdR4qd5dszhQXS5nk6FTPd9sw0vSSLMadISBc2_lA';
  String secret =
      'EDFYQf8itbqoWi-9BIzgzrNvGWLI62UEliT1i8f_APi_MAJkteZLwnXGmTvBkBIRAVy-jCBi-PmYyNUa';

  // for getting the access token from Paypal
  Future<String> getAccessToken() async {
    try {
      var client = BasicAuthClient(clientId, secret);
      Uri uri =
          Uri.parse('$domain/v1/oauth2/token?grant_type=client_credentials');
      var response = await client.post(uri);
      print("response");
      print(response.statusCode);
      if (response.statusCode == 200) {
        final body = convert.jsonDecode(response.body);
        return body["access_token"];
      }
      return "";
    } catch (e) {
      rethrow;
    }
  }

  // for creating the payment request with Paypal
  Future<Map<String, String>> createPaypalPayment(
      transactions, accessToken) async {
    try {
      Uri uri = Uri.parse("$domain/v2/checkout/orders");

      var response = await http.post(uri,
          body: convert.jsonEncode(transactions),
          headers: {
            "content-type": "application/json",
            'PayPal-Request-Id': '7b92603e-77ed-4896-8e78-5dea2050476e',
            'Authorization': 'Bearer ' + accessToken
          });

      final body = convert.jsonDecode(response.body);
      print("response - ${response.body}");
      if (response.statusCode == 200) {
        if (body["links"] != null && body["links"].length > 0) {
          List links = body["links"];
          String executeUrl = "";
          String approvalUrl = "";
          final item = links.firstWhere((o) => o["rel"] == "payer-action",
              orElse: () => null);
          if (item != null) {
            approvalUrl = item["href"];
          }
          final item1 = links.firstWhere((o) => o["rel"] == "self",
              orElse: () => null);
          if (item1 != null) {
            executeUrl = item1["href"];
          }
          return {"executeUrl": executeUrl, "approvalUrl": approvalUrl,};
        }
        return {};
      } else {
        throw Exception(body["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  // for executing the payment transaction
  Future<String> executePayment(url, accessToken) async {
    try {
      var response = await http.post(Uri.parse(url+"/capture"),
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer ' + accessToken
          });

      final body = convert.jsonDecode(response.body);
      print("response - ${response.body}");
      if (response.statusCode == 201) {
        return body["purchase_units"][0]["payments"]["captures"][0]["id"];
      }
      return "";
    } catch (e) {
      rethrow;
    }
  }
}
