import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ZodeakX extends StatelessWidget {
  const ZodeakX({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
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
    // ChangeNotifierProvider(create: (_) => MarketViewModel()),
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
      body: Container(),
    );
  }
}
