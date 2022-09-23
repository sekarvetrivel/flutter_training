import 'package:flutter/material.dart';

class MyStreamBuilder extends StatefulWidget {
  const MyStreamBuilder({Key? key}) : super(key: key);

  @override
  _MyStreamBuilderState createState() => _MyStreamBuilderState();
}

class _MyStreamBuilderState extends State<MyStreamBuilder> {
  Stream<int> generateStream = (() async* {
    await Future<void>.delayed(Duration(seconds: 2));
    yield 1;
    await Future<void>.delayed(Duration(seconds: 1));
    yield 2;
    await Future<void>.delayed(Duration(seconds: 1));
    yield 3;
    await Future<void>.delayed(Duration(seconds: 2));
    yield 4;
    await Future<void>.delayed(Duration(seconds: 3));
    yield 5;
    await Future<void>.delayed(Duration(seconds: 1));
    yield 6;
  })();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: generateStream,
      initialData: 0,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator.adaptive();
        }
        if (snapshot.hasError) {
          return Text("Error");
        } else {
          return Text(
            snapshot.data.toString(),
            style: TextStyle(fontSize: 30),
          );
        }
      },
    );
  }
}
