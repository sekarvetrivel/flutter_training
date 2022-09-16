import 'package:flutter/material.dart';

class AddChildExamplePage extends StatefulWidget {
  const AddChildExamplePage({super.key, required this.title});

  final String title;

  @override
  State<AddChildExamplePage> createState() => _AddChildExamplePageState();
}

class _AddChildExamplePageState extends State<AddChildExamplePage> {
  List<Widget> _children = [];
  int idx = 0;

  @override
  void initState() {
    super.initState();

    this._children = [
      ElevatedButton(
          key: Key(this.idx.toString()),
          child: Text("Button " + idx.toString()),
          onPressed: () {})
    ];
  }

  void addChildHandler() {
    this.idx++;
    this.setState(() {
      var newChild = ElevatedButton(
          key: Key(this.idx.toString()),
          child: Text("Button " + idx.toString()),
          onPressed: () {});
      this._children.add(newChild);
    });
  }

  @override
  Widget build(BuildContext context) {
    this._children = this._children == null ? [] : List.from(this._children);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Column(children: this._children)),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            this.addChildHandler();
          }),
    );
  }
}
