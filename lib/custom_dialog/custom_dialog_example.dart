import 'package:flutter/material.dart';

import 'components/CustomBottomSheet.dart';

class CustomDialogPage extends StatefulWidget {
  const CustomDialogPage({super.key, required this.title});

  final String title;

  @override
  State<CustomDialogPage> createState() => _CustomDialogPageState();
}

class _CustomDialogPageState extends State<CustomDialogPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Text("Click Me"),
          onPressed: () => _showModal(),
        ),
      ),
    );
  }

  dynamic _showModal() async {
    final result = await Navigator.of(context).push(FullScreenModal());
  }
}
