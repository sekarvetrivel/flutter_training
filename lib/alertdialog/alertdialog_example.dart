import 'package:flutter/material.dart';

import '../global/global_functions.dart';

enum ConfirmAction { Cancel, Accept }

enum Product { Apple, Samsung, Oppo, Redmi }

class AlertdialogPage extends StatefulWidget {
  const AlertdialogPage({super.key, required this.title});

  final String title;

  @override
  State<AlertdialogPage> createState() => _AlertdialogPageState();
}

class _AlertdialogPageState extends State<AlertdialogPage> {
  TextEditingController _textFieldController = TextEditingController();

  showBasicAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Simple Alert"),
      content: Text("This is an alert message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showTextFieldAlertDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('TextField AlertDemo'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "TextField in Dialog"),
            ),
            actions: <Widget>[
              new TextButton(
                child: new Text('SUBMIT'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Future<ConfirmAction?> showConfirmationAlertDialog(
      BuildContext context) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete This Contact?'),
          content: const Text('This will delete the contact from your device.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.Cancel);
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.Accept);
              },
            )
          ],
        );
      },
    );
  }

  Future<Product?> showSelectOptionAlertDialog(BuildContext context) async {
    return await showDialog<Product>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select Product '),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Product.Apple);
                },
                child: const Text('Apple'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Product.Samsung);
                },
                child: const Text('Samsung'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Product.Oppo);
                },
                child: const Text('Oppo'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Product.Redmi);
                },
                child: const Text('Redmi'),
              ),
            ],
          );
        });
  }

  @override
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
                  showBasicAlertDialog(context);
                },
                child: Text('Basic AlertDialog')),
            ElevatedButton(
                onPressed: () async {
                  final ConfirmAction? action =
                      await showConfirmationAlertDialog(context);
                  mySnackBar(
                    context,
                    action == ConfirmAction.Accept
                        ? "Confirm Action is Accept"
                        : "Confirm Action is Cancel",
                  );
                },
                child: Text('Confirmation AlertDialog')),
            ElevatedButton(
                onPressed: () async {
                  final Product? prodName =
                      await showSelectOptionAlertDialog(context);
                  var productName = "";
                  switch (prodName) {
                    case Product.Apple:
                      productName = "Apple";
                      break;
                    case Product.Samsung:
                      productName = "Samsung";
                      break;
                    case Product.Oppo:
                      productName = "Oppo";
                      break;
                    case Product.Redmi:
                      productName = "Redmi";
                      break;
                  }
                  if (productName != "")
                    mySnackBar(context, "Selected Product is $productName");
                },
                child: Text('Select AlertDialog')),
            ElevatedButton(
                onPressed: () {
                  showTextFieldAlertDialog(context);
                },
                child: Text('TextField AlertDialog')),
          ],
        ),
      ),
    );
  }
}
