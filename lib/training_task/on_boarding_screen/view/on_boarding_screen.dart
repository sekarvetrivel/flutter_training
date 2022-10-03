import 'package:flutter/material.dart';
import 'package:flutter_training/training_task/on_boarding_screen/view_model/on_boarding_view_model.dart';
import 'package:flutter_training/training_task/widgets/custom_button.dart';
import 'package:flutter_training/training_task/widgets/custom_container.dart';
import 'package:flutter_training/training_task/widgets/custom_scaffold.dart';
import 'package:flutter_training/training_task/widgets/custom_sized_box.dart';
import 'package:flutter_training/training_task/widgets/custom_stack.dart';
import 'package:flutter_training/training_task/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../../global/global_functions.dart';
import '../../login_screen/view/login_screen.dart';
import '../components/on_boarding_page_slide.dart';

var horizontalPadding = 0.05;

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late OnBoardingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    viewModel = context.watch<OnBoardingViewModel>();
    Size size = MediaQuery.of(context).size;
    return Provider(
      create: (BuildContext context) => OnBoardingViewModel(),
      child: CustomScaffold(
        resizeToAvoidBottomInset: false,
          body: CustomStack(
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
                description: "Thousand of Discounts ",
                quote: "All for you",
              ),
              OnBoardPageSlide(
                image: "assets/images/onboard3.jpg",
                description: "Save Time and Money ",
                quote: "All for you",
              ),
            ],
          ),
          buildStaticItems(size, controller, viewModel),
          GestureDetector(onHorizontalDragUpdate: (details) {
            int sensitivity = 8;
            if (details.delta.dx > sensitivity) {
              controller.previousPage(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut);
            } else if (details.delta.dx < -sensitivity) {
              controller.nextPage(
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn);
            }
          }),
        ],
      )),
    );
  }

  _onPageViewChange(int page) {
    viewModel.updateIndicatorPosition(page);
  }

  Widget buildStaticItems(
      Size size, PageController controller, OnBoardingViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSizedBox(
            height: size.height * 0.2,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  controller.jumpToPage(0);
                },
                child: CustomContainer(
                  margin: EdgeInsets.symmetric(horizontal: size.height * 0.005),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      shape: BoxShape.circle,
                      color: viewModel.indicatorPosition == 0
                          ? Colors.white
                          : Colors.amber),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.jumpToPage(1);
                },
                child: CustomContainer(
                  margin: EdgeInsets.symmetric(horizontal: size.height * 0.005),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      shape: BoxShape.circle,
                      color: viewModel.indicatorPosition == 1
                          ? Colors.white
                          : Colors.amber),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.jumpToPage(2);
                },
                child: CustomContainer(
                  margin: EdgeInsets.symmetric(horizontal: size.height * 0.005),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      shape: BoxShape.circle,
                      color: viewModel.indicatorPosition == 2
                          ? Colors.white
                          : Colors.amber),
                ),
              ),
            ],
          ),
          CustomSizedBox(
            height: size.height * (horizontalPadding / 10),
          ),
          CustomText(
            text: "comkit.",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          CustomSizedBox(
            height: size.height * 0.45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomButton(
                press: () {
                  navigateToPageSTFull(
                      context, LoginScreen(title: "Login Screen"));
                },
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
          CustomSizedBox(
            height: size.height * 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                press: () {
                  print("Register Pressed");
                },
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
}
