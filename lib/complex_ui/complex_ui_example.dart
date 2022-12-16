import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket;

class ComplexUIPage extends StatefulWidget {
  const ComplexUIPage({super.key, required this.title});

  final String title;

  @override
  State<ComplexUIPage> createState() => _ComplexUIPageState();
}

Color primary = Color(0xff4fa8a9);
Color primaryDark = Color(0xff214748);
Color accent = Color(0xffe37e7c);
Color accentLight = Color(0xfff7aeac);
double leftMargin = 30;
double? centralBoxSize;

class _ComplexUIPageState extends State<ComplexUIPage>
    with TickerProviderStateMixin {
  late AnimationController _controllerBody;
  late Animation<double> _animationBody;

  late AnimationController _controllerBulb;
  late Animation<double> _animationBulb;
  late socket.Socket webSocket;

  @override
  void initState() {
    _controllerBody = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animationBody = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controllerBody,
      curve: Curves.easeOut,
    ));

    _controllerBulb = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _animationBulb = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controllerBulb,
      curve: Curves.easeInOutQuint,
    ));
    listenSockets();
    super.initState();
  }

  @override
  void dispose() {
    _controllerBody.dispose();
    _controllerBulb.dispose();
    webSocket.dispose();
    super.dispose();
  }

  /// Listen Sockets
  listenSockets() async {
    webSocket = socket.io(
        "http://swapfulfrontsox.zodeak-dev.com:3335/",
        socket.OptionBuilder()
            .setExtraHeaders(<String, dynamic>{
              'authorization':
                  "bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiNjM4NTlmNTRlMzdlMmE1NDkxOGEyMmYzIiwiZGQiOnsiaXAiOiIxMzYuMjMyLjIyMi4xMzAiLCJsb2NhdGlvbiI6IiwgSW5kaWEiLCJkZXZpY2UiOiJkZXNrdG9wIiwic291cmNlIjoid2ViIiwib3MiOiJPUyBYIiwiYnJvd3NlciI6IkNocm9tZSIsInBsYXRmb3JtIjoiQXBwbGUgTWFjIn0sImlhdCI6MTY2OTcwOTMxOCwiZXhwIjoxNjY5NzExMTE4fQ.7hgt6gtHno3FGRKs7rynmKAI55NhfK-ydsmX9PkkDok",
              'withCredentials': false
            })
            .setTransports(['websocket'])
            .disableAutoConnect()
            .enableReconnection()
            .build());

    webSocket.connect();
    webSocket.onConnect((_) {
      print(
          'connect: ${webSocket.connected} socketLink: ${webSocket.io.uri} socket_ID ${webSocket.id} ');
      webSocket.onDisconnect((data) => print("disconnected"));
      webSocket.onConnectError((data) => print("connect_error: $data"));
      webSocket.onConnectTimeout((data) => print("connect_timeout: $data"));
      webSocket.onConnecting((data) => print("connecting: $data"));
      webSocket.onError((data) => print("error: $data"));
      webSocket.onReconnect((data) => print("reconnect: $data"));
      webSocket
          .onReconnectAttempt((data) => print("reconnect_attempt: $data"));
      webSocket.onReconnectFailed((data) => print("reconnect_failed: $data"));
      webSocket.onReconnectError((data) => print("reconnect_error: $data"));
      webSocket.onReconnecting((data) => print("reconnecting: $data"));
      webSocket.onPing((data) => print("ping: $data"));
      webSocket.onPong((data) => print("pong: $data"));
    });
  }

  @override
  Widget build(BuildContext context) {
    _controllerBody.forward();
    _controllerBulb.forward();
    return Builder(
      builder: (BuildContext context) {
        centralBoxSize ??= MediaQuery.of(context).size.height / 6;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: primary,
            leading: Container(
              margin: EdgeInsets.only(left: 30),
              child: Icon(
                Icons.menu,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 30,
                ),
                child: Text(
                  'Generation',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                          )),
                      margin: EdgeInsets.only(top: 80),
                    ),
                    FadeTransition(
                      opacity: _animationBody,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 1),
                          end: Offset(0, 0),
                        ).animate(_animationBody),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //THE SWITCH
                            Container(
                              height: centralBoxSize,
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.only(left: leftMargin),
                                width: 120,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  border: Border.all(
                                    color: primary.withOpacity(0.3),
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      height: 80,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: primary.withOpacity(0.8),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25),
                                          )),
                                      child: Icon(
                                        Icons.attach_money,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                    Icon(
                                      Icons.flash_on,
                                      color: primary.withOpacity(0.5),
                                      size: 40,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: leftMargin),
                              height: centralBoxSize,
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Saved today'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: primaryDark,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "\$1.55".toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 66,
                                        color: primaryDark,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: leftMargin),
                              height: centralBoxSize,
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Current production'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: accent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "\$0.34".toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 36,
                                      color: accent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //THE BOTTOM BAR
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  TextButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.lightbulb_outline,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.wb_sunny,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.brightness_3,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: accent,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.elliptical(90, 100),
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: _animationBulb,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 1),
                          end: Offset(0, 0),
                        ).animate(_animationBulb),
                        child: Align(
                          alignment: Alignment.topRight,
                          //THE BULB
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                    margin: EdgeInsets.only(top: 40),
                                    height: 80,
                                    width: 90,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(40))),
                                    )),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 200,
                                  child: ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment(-0.4, -0.8),
                                        stops: [0.0, 0.5, 0.5, 1],
                                        colors: [
                                          accentLight,
                                          accentLight,
                                          accent,
                                          accent,
                                        ],
                                        tileMode: TileMode.repeated,
                                      ).createShader(bounds);
                                    },
                                    child: Icon(
                                      Icons.lightbulb_outline,
                                      size: 350,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  margin: EdgeInsets.only(top: 28),
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.9),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(105),
                                        topRight: Radius.elliptical(5, 0),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          backgroundColor: primary,
        );
      },
    );
  }
}
