import 'package:flutter/material.dart';
import 'package:fluttertraining/training_task/login_screen/view_model/login_view_model.dart';
import 'package:fluttertraining/training_task/on_boarding_screen/view/on_boarding_screen.dart';
import 'package:fluttertraining/training_task/widgets/custom_button.dart';
import 'package:fluttertraining/training_task/widgets/custom_card.dart';
import 'package:fluttertraining/training_task/widgets/custom_container.dart';
import 'package:fluttertraining/training_task/widgets/custom_scaffold.dart';
import 'package:fluttertraining/training_task/widgets/custom_sized_box.dart';
import 'package:fluttertraining/training_task/widgets/custom_text.dart';
import 'package:fluttertraining/zodeak_x/widgets/custom_loader.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_stack.dart';

Color login = Color(0xff5376a5);

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late LoginViewModel viewModel;
  TextEditingController userText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  FocusNode userFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  final double circleRadius = 100.0;
  final _snackBar = SnackBar(
    content: Text("Please Enter Credential First"),
    backgroundColor: Colors.red,
  );

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    userFocus.addListener(_onUserFocusChange);
    passwordFocus.addListener(_onPasswordFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    userFocus.removeListener(_onUserFocusChange);
    passwordFocus.removeListener(_onPasswordFocusChange);
    userFocus.dispose();
    passwordFocus.dispose();
  }

  void _onUserFocusChange() {
    viewModel.changeAnimation("user");
    _animationController.forward(from: 0);
  }

  void _onPasswordFocusChange() {
    viewModel.changeAnimation("password");
    _animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    viewModel = context.watch<LoginViewModel>();
    Size size = MediaQuery.of(context).size;

    return Provider(
      create: (BuildContext context) => LoginViewModel(),
      child: CustomScaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: CustomContainer(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/login.png"),
              fit: BoxFit.cover,
            )),
            child: viewModel.needToLoad
                ? CustomLoader()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "My Account",
                        style: TextStyle(fontSize: 30),
                      ),
                      CustomSizedBox(
                        height: size.height * 0.05,
                      ),
                      CustomStack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: circleRadius / 2.0),
                            child: CustomCard(
                              child: CustomContainer(
                                padding: EdgeInsets.all(25.0),
                                width: size.width * 0.85,
                                height: size.height * 0.5,
                                child: Column(
                                  children: [
                                    CustomSizedBox(
                                      height: size.height * 0.07,
                                    ),
                                    TextField(
                                      controller: userText,
                                      focusNode: userFocus,
                                      onTap: () {},
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.account_circle_outlined,
                                        ),
                                        hintText: "Login",
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: login),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Switch(
                                            activeColor: login,
                                            value: viewModel.passwordVisible,
                                            onChanged: (bool value) {
                                              viewModel.changeIcon();
                                            })
                                      ],
                                    ),
                                    TextField(
                                      controller: passwordText,
                                      focusNode: passwordFocus,
                                      onTap: () {},
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      obscureText: !viewModel.passwordVisible,
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            Icon(Icons.lock_outline_rounded),
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: login),
                                        ),
                                      ),
                                    ),
                                    CustomSizedBox(
                                      height:
                                          size.height / 3 * horizontalPadding,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          press: () {
                                            print("Forgot Password Pressed");
                                          },
                                          text: "Forgot Password ?",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    CustomSizedBox(
                                      height: size.height * 0.05,
                                    ),
                                    CustomButton(
                                        press: () {
                                          if (userText.text.isNotEmpty &&
                                              passwordText.text.isNotEmpty)
                                            viewModel.loginUser(userText.text,
                                                passwordText.text, context);
                                          else
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              _snackBar,
                                            );
                                        },
                                        text: "Sign in",
                                        radius: 0,
                                        buttonColor: login,
                                        borderColor: Colors.transparent,
                                        textColor: Colors.white,
                                        width: size.width * 0.85,
                                        height: size.height * 0.075,
                                        isBorderedButton: false,
                                        borderWidth: 0,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          CustomContainer(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: login, shape: BoxShape.circle),
                            width: size.width * 0.275,
                            height: size.width * 0.275,
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(45),
                                child: Lottie.asset(
                                  viewModel.loginAnimation,
                                  controller: _animationController,
                                  onLoaded: (composition) {
                                    _animationController
                                      ..duration = composition.duration
                                      ..forward();
                                  },
                                  repeat: false,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
