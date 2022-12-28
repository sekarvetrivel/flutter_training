import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/my_button.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key, required this.title});

  final String title;

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

Color background = Color(0Xff292e3f);

class _CalculatorPageState extends State<CalculatorPage> {
  var userInput = '';
  var answer = '';

  // Array of button
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                behavior: HitTestBehavior.opaque,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CASIO",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey),
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  buildCensor(),
                  buildCensor(),
                  buildCensor(),
                  buildCensor(),
                ],
              )
            ],
          ),
        ),
        backgroundColor: background,
        elevation: 0,
      ),
      backgroundColor: background,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userInput,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  color: Colors.red,
                  padding:
                      EdgeInsets.symmetric(vertical: 47.175, horizontal: 15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    answer,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Positioned(
                    child: Divider(
                  thickness: 10,
                  color: Colors.blue,
                )),
                Container(
                  color: background,
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 0.0,
                          crossAxisSpacing: 0.0),
                      itemBuilder: (BuildContext context, int index) {
                        // Clear Button
                        if (index == 0) {
                          return MyButton(
                            buttontapped: () {
                              setState(() {
                                userInput = '';
                                answer = '0';
                              });
                            },
                            buttonText: buttons[index],
                            color: background,
                            textColor: Colors.red,
                          );
                        }
                        // +/- button
                        else if (index == 1) {
                          return MyButton(
                            buttonText: buttons[index],
                            color: background,
                            textColor: Colors.white,
                          );
                        }
                        // % Button
                        else if (index == 2) {
                          return MyButton(
                            buttontapped: () {
                              setState(() {
                                userInput += buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            color: background,
                            textColor: Colors.white,
                          );
                        }
                        // Delete Button
                        else if (index == 3) {
                          return MyButton(
                            buttontapped: () {
                              setState(() {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                              });
                            },
                            buttonText: buttons[index],
                            color: background,
                            textColor: Colors.red,
                          );
                        }
                        // Equal_to Button
                        else if (index == 18) {
                          return MyButton(
                            buttontapped: () {
                              setState(() {
                                equalPressed();
                              });
                            },
                            buttonText: buttons[index],
                            color: background,
                            textColor: Colors.white,
                          );
                        }
                        //  other buttons
                        else {
                          return MyButton(
                            buttontapped: () {
                              setState(() {
                                userInput += buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            color: isOperator(buttons[index])
                                ? background
                                : background,
                            textColor: isOperator(buttons[index])
                                ? Colors.white
                                : Colors.white,
                          );
                        }
                      }), // GridView.builder
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCensor() {
    return Row(
      children: [
        Container(
          color: Colors.grey,
          width: 10,
          height: 10,
        ),
        SizedBox(
          width: 1,
        )
      ],
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

// function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
