// ignore: file_names
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

import '../models/device_details.dart';

class AppConstants with ChangeNotifier{
  /// Variable Declaration
  /// WebConstants
  String baseUrl = "http://frontloops.zodeak-dev.com/graphql"; // Live URL
  String demoUrl = "http://192.168.0.228:3000/graphql"; // Demo URL
  String secretCode = '0kYUuE4dzbi7tQxWHA2D7g==';// Api secret
  bool isdemo = false; // Need to run demo
  String encrytAndDecryptCode = '55a51621a6648525';

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin(); // Get Device Details
  DeviceDetails? deviceDetails;
  ValueNotifier<String> userToken = ValueNotifier('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiNjIyZWVmOTAzZTc3ODUzZGMxZGUyYTZkIiwiZGQiOnsiaXAiOiIxMzYuMjMyLjIyMi4xMzAiLCJsb2NhdGlvbiI6IiwgSW5kaWEiLCJkZXZpY2UiOiJkZXNrdG9wIiwic291cmNlIjoid2ViIiwib3MiOiJMaW51eCA2NCIsImJyb3dzZXIiOiJDaHJvbWUiLCJwbGF0Zm9ybSI6IkxpbnV4In0sImlhdCI6MTY1MDUzNzQ0NiwiZXhwIjoxNjUwNTM5MjQ2fQ.JQeTbnrGYrf4Vt2qBxj79PbC7AZkRIGsg8sulZBtwpI'); // User Token
  ValueNotifier<bool> userLoginStatus = ValueNotifier(false);
  ValueNotifier<String> userEmail = ValueNotifier('ZodeakX@gmail.com');
  ValueNotifier<String> userCurrency = ValueNotifier("RUB");
  ValueNotifier<String> QRSecertCode = ValueNotifier("MQYFK6RFKRTEOZ3DGJKDSQK3");
  ValueNotifier<String> buttonValue = ValueNotifier("Enable");
  ValueNotifier<String> antiCodeStatus = ValueNotifier("Create");
  ValueNotifier<String> antiCode = ValueNotifier("1234");
  ValueNotifier<int> googleAuthIndex = ValueNotifier(0);
  ValueNotifier<String> walletCurrency = ValueNotifier("RUB");
  ValueNotifier<bool> userEnableStatus = ValueNotifier(false);
}

AppConstants constant = AppConstants();