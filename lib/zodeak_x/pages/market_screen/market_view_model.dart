//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:zodeakx_mobile/Utils/Constant/AppConstants.dart';
// import 'package:zodeakx_mobile/Utils/Core/Networking/CheckInterConnection/checkInternet.dart';
// import 'package:zodeakx_mobile/Utils/Core/Networking/GraphQL/Exception/HandleResponse.dart';
// import 'package:zodeakx_mobile/Utils/Core/appFunctons/debugPrint.dart';
// import 'package:zodeakx_mobile/ZodeakX/MarketScreen/Model/TradePairsModel.dart';
// import 'package:zodeakx_mobile/ZodeakX/Repositories/ZodeakXRepositories.dart';
//
// import '../../../Common/Repositories/CommonRepository.dart';
// import '../../../Utils/Constant/App_ConstantIcon.dart';
// import '../../../Utils/Core/ColorHandler/DarkandLightTheme.dart';
// import '../../../Utils/Core/Networking/CommonModel/CommonModel.dart';
// import '../../../Utils/Languages/English/StringVariables.dart';
// import '../../../Utils/Widgets/CustomNavigation.dart';
// import '../../../main.dart';
//
// class MarketViewModel extends ChangeNotifier {
//
//   MarketViewModel? viewModel;
//
//
//   final List<Map<String, dynamic>> LogoutArray = [
//     {
//       "title": StringVariables().logIn,
//       "logo": loginImage,
//     },
//     {
//       "title": StringVariables().createAccount,
//       "logo": user_circle,
//     },
//   ];
//   final List<Map<String, dynamic>> LoginArray = [
//     {
//       "title": StringVariables().dashboard,
//       "logo": dashboardImage,
//     },
//     {
//       "title":  StringVariables().currencies,
//       "logo": currencyImage,
//     },
//     {
//       "title":  StringVariables().market,
//       "logo": marketImage,
//     },
//     {
//       "title": StringVariables().exchange,
//       "logo": exchangeImage,
//     },
//     {
//       "title":  StringVariables().wallet,
//       "logo": walletImage,
//     },
//     {
//       "title":  StringVariables().bankDetails,
//       "logo": bankDetailsImage,
//     },
//     {
//       "title":  StringVariables().orders,
//       "logo": orderImage,
//     },
//     {
//       "title":  StringVariables().security,
//       "logo": securityImage,
//     },
//     {
//       "title": StringVariables().setting,
//       "logo": settingImage,
//     },
//     {
//       "title": StringVariables().referral,
//       "logo": referralImage,
//     },
//   ];
//
//   bool noInternet = false;
//   bool needToLoad = true;
//   List<ListOfTradePairs>? viewModelTradePairs;
//   bool loginStatus = false;
//   bool isvisible = true;
//   CommonModel? logout;
//   String? token;
//   /// Loader
//   setLoading(bool loading) async {
//     needToLoad = loading;
//     notifyListeners();
//   }
//
//   ///logout
//   getlogout(CommonModel? devicelogout){
//     logout = devicelogout;
//     if (devicelogout?.statusCode == 200){
//       constant.userLoginStatus.value = false;
//       constant.pref?.setBool('loginStatus', false);
//       constant.pref?.setString("userEmail", "zodeak@mail.com");
//     }
//   }
//   ///Icon visiblity
//   void setVisible() {
//     isvisible = !isvisible;
//     notifyListeners();
//   }
//
// /// initilizing API
//   MarketViewModel(){
//     getUserLogginStatus();
//     getTradePairs();
//
//   }
//
//
// /// set trade pairs
//   setTradePairs(List<ListOfTradePairs>? tradePairs) {
//     viewModelTradePairs = tradePairs;
//     notifyListeners();
//   }
//
//
//
//   ///Toggle Button
//    bool active = themeSupport().isSelectedDarkMode() ? true : false;
//    toggleStatus(bool value,BuildContext context)  {
//     MyApp.of(context)?.toggleDarkMode();
//     active = value;
//     saveTheme();
//     notifyListeners();
//   }
//  /// sabe theme
//   void saveTheme() async{
//     constant.pref?.setString('selectedThemeMode', (active) ? "dark" : "light");
//     constant.pref?.setBool('userSelectedTheme', true);
//   }
//
// removeListner(){
//   this.dispose();
// }
// /// sideMenu navigation
//   navigation(int index,List<Map<String, dynamic>> sideMenuList,BuildContext context){
//     switch (index) {
//       case 0:
//         sideMenuList == LogoutArray ?
//         moveToLogin(context) : moveToDashBoard(context);
//         break;
//       case 1:
//         sideMenuList == LogoutArray ?
//         moveToRegister(context) : moveToCurrency(context);
//         break;
//       case 2:
//         moveToMarket(context);
//         break;
//       case 3:
//         moveToFiatDeposit(context);
//       //  moveToExchange(context);
//         break;
//       case 4:
//         moveToWallets(context);
//         break;
//       case 5:
//         moveToBankDetails(context);
//         break;
//       case 6:
//         moveToOrders(context);
//         break;
//       case 7:
//         moveToSecurity(context,constant.buttonValue.value);
//         break;
//       case 8:
//         moveToSetting(context);
//         break;
//       case 9:
//         moveToReferral(context);
//         break;
//     }
//   }
//
//  getUserLogginStatus(){
//   var token = constant.pref?.getString("userToken") ?? constant.userToken.value;
//   loginStatus = constant.pref?.getBool("loginStatus") ?? false;
//   constant.userEmail.value = constant.pref?.getString("userEmail") ??'';
//
//   constant.userToken.value = token;
//   constant.userLoginStatus.value = loginStatus;
//   securedPrint(loginStatus);
// }
//
//
// /// Get TradePairs
//
//   getTradePairs() async{
//     var hasInternet = await checkInternet.hasInternet();
//     if (hasInternet){
//       var response = await zodeakXRepository.fetchTradePairs();
//       var decodeResponse = HandleResponse.completed(response);
//       switch (decodeResponse.status?.index) {
//         case 0:
//         setLoading(false);
//           break;
//         case 1:
//         setTradePairs(decodeResponse.data?.result);
//         setLoading(false);
//           break;
//         default: setLoading(false); break;
//       }
//     }else{
//       setLoading(true);
//       noInternet = true;
//       notifyListeners();
//     }
//   }
// /// get deviceLogout Details
//   logoutUser(String token) async{
//     setLoading(true);
//
//     Map<String,dynamic> mutateUserParams = {
//       'input': {
//         "token":token
//       }
//     };
//
//     var hasInternet = await checkInternet.hasInternet();
//     if (hasInternet){
//       var response = await commonRepository.MutatelogoutUser(mutateUserParams);
//       var decodeResponse = HandleResponse.completed(response);
//       switch (decodeResponse.status?.index) {
//         case 0:
//           setLoading(false);
//           break;
//         case 1:
//           getlogout(decodeResponse.data as CommonModel);
//           setLoading(false);
//           break;
//         default:
//           setLoading(false);
//           break;
//       }
//     }else{
//       noInternet = true;
//       setLoading(true);
//     }
//   }
// }
