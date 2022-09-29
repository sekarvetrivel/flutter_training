import 'package:flutter/material.dart';
import 'package:flutter_training/global/global_functions.dart';
import 'package:flutter_training/zodeak_x/pages/market_screen/market_view.dart';
import 'package:provider/provider.dart';

import 'pages/market_screen/market_view_model.dart';

class ZodeakX extends StatelessWidget {
  const ZodeakX({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getAllProviers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ZodeakX',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ZodeakXPage(title: 'ZodeakX'),
      ),
    );
  }
}

getAllProviers() {
  return [
    ChangeNotifierProvider(create: (_) => MarketViewModel()),
  ];
}

class ZodeakXPage extends StatefulWidget {
  const ZodeakXPage({super.key, required this.title});

  final String title;

  @override
  State<ZodeakXPage> createState() => _ZodeakXPageState();
}

class _ZodeakXPageState extends State<ZodeakXPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MarketView(),
    );
  }
}
