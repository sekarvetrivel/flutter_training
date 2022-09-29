import 'package:flutter/material.dart';
import 'package:flutter_training/tab_bar/tab_bar_example.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../utils/constants/app_constant_icon.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_circle_avatar.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import 'market_view_model.dart';

class MarketView extends StatefulWidget {
  MarketView({Key? key}) : super(key: key);

  @override
  State<MarketView> createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedScreenIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  String location = 'Null, Press Button';
  String Address = 'search';

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  Widget build(BuildContext context) {
    MarketViewModel tradeModel = context.watch<MarketViewModel>();

    return Provider<MarketViewModel>(
      create: (context) => MarketViewModel(),
      builder: (context, child) {
        return showMarket(
          context,
          tradeModel,
        );
      },
    );
  }

  /// Market Screen
  Widget showMarket(
    BuildContext context,
    MarketViewModel tradeModel,
  ) {
    //Future.delayed(Duration.zero, () => displayDialog(context));
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: ZodeakBottomNavigationBar(
          color: Colors.blue,
          icon: [
            market,
            exchangeImage,
            order,
            walletImage,
          ],
          backgroundColor: Colors.transparent,
          label: ["market", "exchange", "orders", "wallet"],
          heigth: 14,
          fit: BoxFit.fill,
          screens: [
            MarketView(),
            TabBarPage(title: "TabBar"),
            MarketView(),
            MarketView(),
            selectedScreenIndex
          ],
          selectedScreenIndex: 0,
        ),
        key: _scaffoldKey,
        body: Center(
          child: Column(
            children: [
              AppHeader(context),
              TradePairs(context, tradeModel),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tradeModel.passwordVisible ? Text("${tradeModel.passwordValue}") : Text("ZodeakX"),
                  ElevatedButton(
                      onPressed: () {
                        tradeModel.changeIcon();
                        tradeModel.changePassword();
                      },
                      child: Text("change value")),
                ],
              ),
              sizedbox(context),
            ],
          ),
        ),
      ),
    );
  }

  ///Market Screen APPBAR
  Widget AppHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: ZodeakAppBar(
        prefixIconpress: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        middleIconpress: () {},
        suffixIconpress: () {},
        text: "market",
        prefixIcon: userImage,
        suffixIcon: scanner,
        isPrefixIcon: true,
        isMiddleIcon: true,
        middleIcon: search,
        isSuffixIcon: true,
        prefixIconHeight: 32,
        suffixIconHeight: 20,
        prefixIconWidth: 40,
        middleIconHeight: 20,
        middleIconWidth: 20,
        suffixIconWidth: 20,
        containerHeight: 10,
        containerWidth: 1.1,
        padding: 0,
        fontSize: 23,
      ),
    );
  }

  /// TradePairs Lists in ListViewBuilder
  Widget TradePairs(BuildContext context, MarketViewModel tradeModel) {
    return Expanded(
      child: ZodeakXCard(
        radius: 35,
        edgeInsets: 10,
        outerPadding: 10,
        elevation: 0,
        child: ZodeakContainer(
          height: 1.99,
          width: 1.1,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: tradeModel.viewModelTradePairs?.length ?? 0,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                child: ListTile(
                  leading: ZodeakCircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.network(
                        '${tradeModel.viewModelTradePairs?[index].fromImage}'),
                  ),
                  title: ZodeakXText(
                      fontfamily: 'GoogleSans',
                      text: tradeModel.viewModelTradePairs?[index].pair ??
                          "coinName",
                      overflow: TextOverflow.ellipsis),
                  subtitle: ZodeakXText(
                      fontfamily: 'GoogleSans',
                      text:
                          "Vol: ${tradeModel.viewModelTradePairs?[index].volume24H ?? "coinSymbol"}",
                      overflow: TextOverflow.ellipsis),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ZodeakXText(
                          fontfamily: 'GoogleSans',
                          text:
                              "${tradeModel.viewModelTradePairs?[index].lastPrice ?? "coinTotal"}",
                          overflow: TextOverflow.ellipsis),
                      ZodeakXText(
                          fontfamily: 'GoogleSans',
                          text:
                              "${tradeModel.viewModelTradePairs?[index].changePercent ?? "coinChange"}",
                          color:
                              "${tradeModel.viewModelTradePairs?[index].changePercent ?? "coinChange"}"
                                      .contains('-')
                                  ? Colors.pink
                                  : Colors.green,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  ///need space between bottomNavigation and tradePairsCard Widget
  Widget sizedbox(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 35,
    );
  }
}
