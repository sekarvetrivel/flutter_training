import 'package:flutter/material.dart';

import '../../../zodeak_x/networking/graphql/exception/handle_response.dart';
import '../../../zodeak_x/repository/zodeak_x_repository.dart';
import '../../../zodeak_x/utils/core/encrypt_and_decrypt.dart';
import '../../home_screen/view/home_screen.dart';
import '../../utils/reveal_route.dart';
import '../model/login_model.dart';

class LoginViewModel extends ChangeNotifier {
  bool passwordVisible = false;
  bool needToLoad = false;
  String loginAnimation = 'assets/images/lottie/login_user.json';
  LoginModel? userLoginModel;

  setLoading(bool loading) async {
    needToLoad = loading;
    notifyListeners();
  }

  void changeIcon() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  void changeAnimation(String type) {
    if (type == "user")
      loginAnimation = 'assets/images/lottie/login_user.json';
    else
      loginAnimation = 'assets/images/lottie/login_password.json';
    notifyListeners();
  }

  /// getLogin User Details
  setLoginUserDetails(LoginModel? loginModel, context) {
    Size size = MediaQuery.of(context).size;
    userLoginModel = loginModel;
    if (loginModel?.statusCode == 400) {
      if (loginModel?.result == null) {
      } else {
        ((userLoginModel?.result?.tokenType ?? "") == "unlockAccount")
            ? print("moveToReactivateAccount")
            : print("moveToEmailVerification");
      }
    } else {
      print("Login Success");
      Navigator.push(
          context,
          RevealRoute(
            page: HomeScreen(
              title: "Home",
            ),
            maxRadius: 0.0,
            centerAlignment: Alignment.center,
            centerOffset: Offset(size.width / 2, size.height / 2),
          ));
    }
    final _snackBar = SnackBar(
      content: Text(userLoginModel?.statusMessage ?? ""),
      backgroundColor:
          (userLoginModel?.statusCode != 200) ? Colors.red : Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      _snackBar,
    );
  }

  /// Mutate LoginUser

  loginUser(String userEmail, String userPassCode, context) async {
    setLoading(true);
    Map<String, dynamic> mutateUserParams = {
      'data': {
        "type": "email".toLowerCase(),
        "key": encryptDecrypt.encryptUsingAESAlgorithm(userEmail),
        "password": encryptDecrypt.encryptUsingAESAlgorithm(userPassCode),
        "device_type": "mobile"
      }
    };

    var loginResponse =
        await zodeakXRepository.MutateLoginUser(mutateUserParams);
    var decodeResponse = HandleResponse.completed(loginResponse);
    switch (decodeResponse.status?.index) {
      case 0:
        setLoading(false);
        break;
      case 1:
        setLoading(false);
        setLoginUserDetails(decodeResponse.data, context);
        print(decodeResponse.data?.statusMessage);
        break;
      default:
        setLoading(false);
        break;
    }
  }
}
