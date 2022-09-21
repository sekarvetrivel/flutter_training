import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({
    Key? key,
    required this.digitValidator,
  }) : super(key: key);

  final RegExp digitValidator;

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  var _numberForm = GlobalKey<FormState>();
  bool isValidForm = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Form(
              key: _numberForm,
              child: Column(
                children: [
                  TextFormField(
                    validator: (inputValue) {
                      if (inputValue!.isEmpty ||
                          !widget.digitValidator.hasMatch(inputValue)) {
                        return "Please enter number";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    validator: (inputValue) {
                      if (inputValue!.isEmpty) {
                        return "Please Fill before";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_numberForm.currentState!.validate()) {
                          setState(() {
                            isValidForm = true;
                          });
                        } else {
                          setState(() {
                            isValidForm = false;
                          });
                        }
                      },
                      child: Text("Check Number")),
                  SizedBox(
                    height: 5,
                  ),
                  Text(isValidForm ? "Nice" : "Please Fix error and Submit ")
                ],
              )),
        ),
      ),
    );
  }
}
