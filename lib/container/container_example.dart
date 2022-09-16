import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  const ContainerPage({super.key, required this.title});

  final String title;

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: const Text("Hello! i am inside a container!",
                  style: TextStyle(fontSize: 20)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.orange,
              child: const Text("Hello! i am inside a container! with Color",
                  style: TextStyle(fontSize: 20)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.purple,
              child: const Text("Hello! i am inside a container! Sized",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.amber,
              margin: const EdgeInsets.all(20),
              child: const Text(
                  "Hello! i am inside a container! Sized with Margin",
                  style: TextStyle(fontSize: 20)),
            ),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.red,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              child: const Text(
                  "Hello! i am inside a container! with Margin and Padding",
                  style: TextStyle(fontSize: 20)),
            ),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.green,
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              child: const Text(
                  "Hello! i am inside a container! with Alignment",
                  style: TextStyle(fontSize: 20)),
            ),
            Container(
              height: 200,
              width: double.infinity,
              //color: Colors.purple,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
              child: const Text("Hello! i am inside a container! with Decoration",
                  style: TextStyle(fontSize: 20)),
            ),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.black,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              transform: Matrix4.rotationZ(0.1),
              child: const Text("Hello! i am inside a container! with Transform",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            Container(
              color: Colors.pinkAccent,
              margin: EdgeInsets.only(top: 30),
              constraints: BoxConstraints.expand(height: 75.0),
              child: Text("Hello! i am inside a container! with Constraints", style: TextStyle(fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}
