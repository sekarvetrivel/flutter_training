import 'package:flutter/material.dart';

import 'BottomClipper.dart';

class BottomSheetExample extends StatelessWidget {
  BottomSheetExample({Key? key}) : super(key: key);
  var data = [
    {'name': 'Shopping', 'color': Colors.blue, 'icon': Icons.local_shipping},
    {'name': 'Service', 'color': Colors.red, 'icon': Icons.room_service},
    {'name': 'Hotel', 'color': Colors.green, 'icon': Icons.hotel},
    {'name': 'More', 'color': Colors.amber, 'icon': Icons.more},
    {'name': 'Custom', 'color': Colors.orange, 'icon': Icons.add_to_photos},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Sheet"),
      ),
      body: Center(
        child: Container(
          width: 600,
          child: Center(
              child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Align(
                      alignment: Alignment.bottomLeft,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipPath(
                              clipper: BottomCliper(),
                              child: buildSizedBox(context)),
                        ],
                      ),
                    );
                  });
            },
            child: const Text(
              'Choose Option',
              style: TextStyle(fontSize: 24),
            ),
          )),
        ),
      ),
    );
  }

  Widget buildSizedBox(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0, // gap between lines
              children: data
                  .map((e) => Column(
                        children: <Widget>[
                          ClipOval(
                            child: Container(
                              color: e["color"] as Color,
                              child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(
                                    e["icon"] as IconData,
                                    color: Colors.white,
                                    size: 30,
                                  )),
                            ),
                          ),
                          Text(e["name"] as String)
                        ],
                      ))
                  .toList())
        ],
      ),
    );
  }
}
