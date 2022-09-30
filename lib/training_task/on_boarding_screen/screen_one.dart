import 'package:flutter/material.dart';
import 'package:flutter_training/training_task/widgets/custom_curved_button.dart';

class OnboardingScreenOne extends StatefulWidget {
  const OnboardingScreenOne({Key? key}) : super(key: key);

  @override
  _OnboardingScreenOneState createState() => _OnboardingScreenOneState();
}

class _OnboardingScreenOneState extends State<OnboardingScreenOne> {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        PageView(
          controller: controller,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/onboard1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: MyPageSlide(
                description: "Easy and Useful  Pay ",
                quote: "All for you",
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/onboard2.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: MyPageSlide(
                description: "Easy and Useful  Pay ",
                quote: "All for you",
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/onboard3.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: MyPageSlide(
                description: "Easy and Useful  Pay ",
                quote: "All for you",
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.15,
              ),
              Row(
                children: [
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: size.height * 0.005),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        shape: BoxShape.circle,
                        color: Colors.white),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: size.height * 0.005),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        shape: BoxShape.circle,
                        color: Colors.amber),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: size.height * 0.005),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        shape: BoxShape.circle,
                        color: Colors.amber),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.01,
                    horizontal: size.height * 0.005),
                child: Text(
                  "comkit.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 250.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomCurvedButton(
                text: "Login",
                radius: 30,
                buttonColor: Colors.black,
                borderColor: Colors.transparent,
                textColor: Colors.white,
                width: size.width * 0.6,
                height: size.height * 0.09,
                isBorderedButton: false,
                borderWidth: 0,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10, top: 450.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomCurvedButton(
                text: "Register",
                radius: 30,
                buttonColor: Colors.yellow,
                borderColor: Colors.transparent,
                textColor: Colors.black,
                width: size.width * 0.6,
                height: size.height * 0.09,
                isBorderedButton: false,
                borderWidth: 0,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(onHorizontalDragUpdate: (details) {
          int sensitivity = 8;
          if (details.delta.dx > sensitivity) {
            controller.previousPage(
                duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
          } else if (details.delta.dx < -sensitivity) {
            controller.nextPage(
                duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          }
        }),
      ],
    ));
  }
}

class MyPageSlide extends StatelessWidget {
  const MyPageSlide({
    super.key,
    required this.description,
    required this.quote,
  });

  final String description;
  final String quote;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(left: size.height * 0.02, top: size.height * 0.225),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.75,
                child: Text(
                  description,
                  textAlign: TextAlign.start,
                  strutStyle: StrutStyle(
                    height: size.height * 0.005,
                  ),
                  style: TextStyle(
                    letterSpacing: 1,
                    height: size.height * 0.0015,
                    background: Paint()
                      ..color = Colors.white
                      ..style = PaintingStyle.fill,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              Text(
                quote,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.125,
          ),
        ],
      ),
    );
  }
}
