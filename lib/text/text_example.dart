import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../global/global_functions.dart';

class TextPage extends StatefulWidget {
  const TextPage({super.key, required this.title});

  final String title;

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    var paintFill = Paint();
    paintFill.color = Colors.black54;
    paintFill.style = PaintingStyle.fill;

    var paintStroke = Paint();
    paintStroke.color = Colors.black54;
    paintStroke.style = PaintingStyle.stroke;
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
            Text("Welcome to Text Page"),
            SizedBox(
              height: 15,
            ),
            Text(
              "Hello World! This is a Text Widget.",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 8,
                  wordSpacing: 20,
                  backgroundColor: Colors.black,
                  shadows: [
                    Shadow(
                        color: Colors.blue,
                        offset: Offset(2, 1),
                        blurRadius: 10)
                  ]),
            ),
            SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(
                  text: 'Don\'t have an account?',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Sign up',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          mySnackBar(context, "Sign up Clicked");
                        },
                    )
                  ]),
            ),
            Container(
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyText1,
                    children: [
                      TextSpan(text: 'Click ', style: TextStyle(fontSize: 25)),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Icon(Icons.add, color: Colors.red),
                        ),
                      ),
                      TextSpan(text: ' to add', style: TextStyle(fontSize: 25)),
                    ],
                  ),
                ),
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Hello', // default text style
                children: <TextSpan>[
                  TextSpan(
                      text: ' beautiful ',
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  TextSpan(
                      text: 'world',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SelectionArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Selectable text'),
                  SelectionContainer.disabled(
                      child: Text('Non-selectable text')),
                  Text('Selectable text'),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(15),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Column(
                    children: [
                      Text("Text Without Any Style"),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text With Color",
                          style: TextStyle(color: Colors.deepOrange)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text With Color and FontSize",
                          style: TextStyle(
                              color: Colors.deepOrange, fontSize: 30)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text With Color, FontSize and FontWeight",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text With Color, FontSize and FontWeight",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.w100)),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                          "Text With Color, FontSize, FontWeight and FontStyle",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text With Letter Spacing",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 20)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Flutter With Word Spacing",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                              wordSpacing: 30)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text With Painting Style Fill",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            foreground: paintFill,
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text With Painting Style Stroke",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            foreground: paintStroke,
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text Background With Painting Style Fill",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              background: new Paint()
                                ..color = Colors.black54
                                ..style = PaintingStyle.fill
                                ..strokeWidth = 1)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text Background With Painting Style Stroke",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              background: new Paint()
                                ..color = Colors.black54
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 1)),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Text With Shadow",
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            shadows: [
                              Shadow(
                                  color: Colors.black54,
                                  offset: Offset(1, 2),
                                  blurRadius: 4)
                            ]),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text With Decoration LineThrough",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.lineThrough)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text With Decoration OverLine",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.overline)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text With Decoration UnderLine",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.underline)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text With Decoration UnderLine with Color",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black54)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text With Decoration Double UnderLine with Color",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black54,
                              decorationStyle: TextDecorationStyle.double)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text With Decoration Dashed with Color",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black54,
                              decorationStyle: TextDecorationStyle.dashed)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text With Decoration Dotted with Color",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black54,
                              decorationStyle: TextDecorationStyle.dotted)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text With Decoration Solid with Color",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black54,
                              decorationStyle: TextDecorationStyle.solid)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Text With Decoration Wavy with Color",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black54,
                              decorationStyle: TextDecorationStyle.wavy)),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                          "Text With Decoration Wavy with Color and Custom Font",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black54,
                              decorationStyle: TextDecorationStyle.wavy,
                              fontFamily: "caveat")),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Text With Start Alignment",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Text With Center Alignment",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Text With End Alignment",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Text With example of text direction rtl - right to left",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Text With example of softwrap is false and normal fontweight",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        softWrap: false,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Text With example of softwrap is true and normal fontweight",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Text With example of overflow and normal fontweight",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Text With example of maxLines and normal fontweight",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Text With example of textScaleFactor",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                        textScaleFactor: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
