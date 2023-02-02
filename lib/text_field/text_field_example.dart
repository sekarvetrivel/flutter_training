import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertraining/text_field/components/my_custom_form.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key, required this.title});

  final String title;

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  TextEditingController textController = TextEditingController();
  TextEditingController textControllerWithInitialText =
      TextEditingController(text: "Initial Text");
  String displayText = "";

  RegExp digitValidator = RegExp("[0-9]+");
  bool isANumber = true;

  void setValidator(valid) {
    setState(() {
      isANumber = valid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueAccent,
                hintText: "TextField with Fill Color",
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "TextField with Custom Cursor and Text Color",
                filled: true,
                fillColor: Colors.blueAccent,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "Enter your name - (Example for Hint Text)"),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "Textfield with 5 lines"),
            ),
            Column(
              children: [
                TextField(
                  controller: textController,
                  maxLines: null,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        displayText = textController.text;
                      });
                    },
                    child: Text("Show Text")),
                Text(
                  displayText,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            TextField(
              controller: textControllerWithInitialText,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "TextField with initial value"),
            ),
            TextFormField(
              initialValue: "Initial Text with TextFormField",
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "TextField with for Number"),
            ),
            TextField(
              keyboardType: TextInputType.number,
              obscureText: true,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "TextField for Password"),
            ),
            TextField(
              maxLength: 2,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "TextField With Character max restriction"),
            ),
            TextField(
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "TextField With restrict digits"),
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp("[0-9]+"))
              ],
            ),
            TextField(
              onChanged: (inputValue) {
                if (inputValue.isEmpty || digitValidator.hasMatch(inputValue)) {
                  setValidator(true);
                } else {
                  setValidator(false);
                }
              },
              decoration: InputDecoration(
                errorText: isANumber ? null : "Please enter a number",
                hintStyle: TextStyle(color: Colors.blue),
                hintText: "TextField With digit validation",
              ),
            ),
            TextField(
              onChanged: (inputValue) {
                if (inputValue.isEmpty || digitValidator.hasMatch(inputValue)) {
                  setValidator(true);
                } else {
                  setValidator(false);
                }
              },
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "TextField With digit validation with custom color",
                  errorText: isANumber ? null : "Please enter a number",
                  errorStyle: TextStyle(color: Colors.purpleAccent),
                  focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purpleAccent)),
                  errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purpleAccent))),
            ),
            MyCustomForm(digitValidator: digitValidator),
          ]),
        ),
      ),
    );
  }
}
