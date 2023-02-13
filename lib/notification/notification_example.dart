import 'package:flutter/material.dart';

import 'components/my_badge.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key, required this.title});

  final String title;

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool showOrHideBadge = true;
  int incAndDec = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyBadge(
              value: incAndDec != 0 ? incAndDec.toString() : "",
              hide: showOrHideBadge,
              top: 2,
              right: 2,
              color: Colors.red,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: Icon(
                  Icons.shop,
                  size: 25,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text(showOrHideBadge ? "Hide" : "Show"),
              onPressed: () {
                setState(() {
                  showOrHideBadge = !showOrHideBadge;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text("Dec"),
                  onPressed: () {
                    setState(() {
                      if (incAndDec > 0) incAndDec--;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  child: Text("Inc"),
                  onPressed: () {
                    setState(() {
                      incAndDec++;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
