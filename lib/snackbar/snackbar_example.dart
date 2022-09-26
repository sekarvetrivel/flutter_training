import 'package:flutter/material.dart';

class SnackbarPage extends StatefulWidget {
  const SnackbarPage({super.key, required this.title});

  final String title;

  @override
  State<SnackbarPage> createState() => _SnackbarPageState();
}

class _SnackbarPageState extends State<SnackbarPage> {
  final _snackBar1 = SnackBar(content: Text('Welcome to Snackbar'));
  final _snackBar2 = SnackBar(
    content: Text('Snackbar with BG Color'),
    backgroundColor: Colors.teal,
  );
  final _snackBar3 = SnackBar(
    content: Text('Snackbar with Padding'),
    padding: EdgeInsets.all(25.0),
  );
  final _snackBar4 = SnackBar(
    content: Text('Snackbar with Rounder Corners'),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
  final _snackBar5 = SnackBar(
    content: Text('Snackbar with Floating'),
    behavior: SnackBarBehavior.floating,
  );
  final _snackBar6 = SnackBar(
    content: Text('Snackbar with Static Width'),
    behavior: SnackBarBehavior.floating,
    width: 200,
  );
  final _snackBar7 = SnackBar(
    content: Text('Snackbar with Margin'),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(30.0),
  );
  final _snackBar8 = SnackBar(
    content: Text('Snackbar with Action'),
    duration: const Duration(seconds: 10),
    action: SnackBarAction(
      label: 'Click',
      onPressed: () {
        print('Action is clicked');
      },
      textColor: Colors.white,
      disabledTextColor: Colors.grey,
    ),
  );
  final _snackBar9 = SnackBar(
    content: Text('Snackbar with Duration'),
    duration: const Duration(seconds: 10),
  );
  final _snackBar10 = SnackBar(
      content: Text('Snackbar On Visible'),
      onVisible: () {
        print('Snackbar is visible');
      });

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(_snackBar1);
                },
                child: Text('Simple Snackbar')),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(_snackBar2);
                },
                child: Text('Custom BG Snackbar')),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(_snackBar3);
                },
                child: Text('Custom Padding Snackbar')),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(_snackBar4);
                },
                child: Text('Custom Corner Snackbar')),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(_snackBar5);
                },
                child: Text('Custom Floating Snackbar')),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(_snackBar6);
                },
                child: Text('Custom Static Width Snackbar')),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(_snackBar7);
                },
                child: Text('Custom Margin Snackbar')),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(_snackBar8);
                },
                child: Text('Custom Snackbar with Action')),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(_snackBar9);
                },
                child: Text('Custom Snackbar with Duration')),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(_snackBar10);
                },
                child: Text('Custom Snackbar with OnVisible')),
          ],
        ),
      ),
    );
  }
}
