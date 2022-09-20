import 'package:flutter/material.dart';

class IconsPage extends StatefulWidget {
  const IconsPage({super.key, required this.title});

  final String title;

  @override
  State<IconsPage> createState() => _IconsPageState();
}

class _IconsPageState extends State<IconsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Icon Without Properties',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.camera_enhance),
                  Icon(Icons.camera_front),
                  Icon(Icons.camera_rear),
                ]),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Icon With Color And Size',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.camera_enhance, size: 70, color: Colors.green),
                  Icon(Icons.camera_front, size: 70, color: Colors.orange),
                  Icon(Icons.camera_rear, size: 70, color: Colors.black),
                ]),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Icon With Label',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(children: <Widget>[
                    Icon(Icons.camera_enhance, size: 70),
                    Text('Camera'),
                  ]),
                  Column(children: <Widget>[
                    Icon(Icons.camera_front, size: 70),
                    Text('Front Camera'),
                  ]),
                  Column(children: <Widget>[
                    Icon(Icons.camera_rear, size: 70),
                    Text('Rear Camera'),
                  ]),
                ]),
          ],
        ),
      ),
    );
  }
}
