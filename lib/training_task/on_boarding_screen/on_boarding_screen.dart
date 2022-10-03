import 'package:flutter/material.dart';
import 'package:flutter_training/training_task/widgets/custom_curved_button.dart';

import 'components/on_boarding_page_slide.dart';

var horizontalPadding = 0.05;

class OnboardingScreenOne extends StatefulWidget {
  const OnboardingScreenOne({Key? key}) : super(key: key);

  @override
  _OnboardingScreenOneState createState() => _OnboardingScreenOneState();
}

class _OnboardingScreenOneState extends State<OnboardingScreenOne> {
  int current_page = 0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        PageView(
          onPageChanged: _onPageViewChange,
          controller: controller,
          children: [
            OnBoardPageSlide(
              image: "assets/images/onboard1.jpg",
              description: "Easy and Useful  Pay ",
              quote: "All for you",
            ),
            OnBoardPageSlide(
              image: "assets/images/onboard2.jpeg",
              description: "page 2",
              quote: "All for you",
            ),
            OnBoardPageSlide(
              image: "assets/images/onboard3.jpg",
              description: "page 3 ",
              quote: "All for you",
            ),
          ],
        ),
        buildStaticItems(size, controller),
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

  Widget buildStaticItems(Size size, PageController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  controller.jumpToPage(0);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: size.height * 0.005),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      shape: BoxShape.circle,
                      color: current_page == 0 ? Colors.white : Colors.amber),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.jumpToPage(1);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: size.height * 0.005),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      shape: BoxShape.circle,
                      color: current_page == 1 ? Colors.white : Colors.amber),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.jumpToPage(2);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: size.height * 0.005),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      shape: BoxShape.circle,
                      color: current_page == 2 ? Colors.white : Colors.amber),
                ),
              ),
            ],
          ),
          Text(
            "comkit.",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: size.height * 0.45,
          ),
          Row(
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
          SizedBox(
            height: size.height * 0.025,
          ),
          Row(
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
        ],
      ),
    );
  }

  _onPageViewChange(int page) {
    setState(() {
      current_page = page;
    });
  }
}
