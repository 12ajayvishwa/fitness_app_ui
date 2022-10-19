import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/buttons/auth_button.dart';
import '../../utils/colors.dart';
import '../../utils/gradient_text_color.dart';
import '../../utils/text_style.dart';
import '../../utils/validator.dart';
import '../../widgets/custom_text_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
              top: size.height * 0.05,
              child: Column(
                children: [
                  Text(
                    "Hey there,",
                    style: kLargeTextRegular(const Color(0xFF1D1617)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Welcome Back",
                    style: kTitleH4Bold(const Color(0xFF1D1617)),
                  )
                ],
              )),
          Positioned(
              top: size.height * 0.129,
              left: size.width * 0.03,
              right: size.width * 0.03,
              child: formComponent(
                size,
              )),
          Positioned(
              bottom: size.height * 0.220,
              child: AuthButton(
                  text: "Login",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      print(emailController.text);
                      print(passwordController.text);
                    }
                  },
                  svgPicture1: "assets/icons/bold/Login.svg",
                  size: size)),
          Positioned(
              bottom: size.height * 0.161,
              child: SizedBox(
                height: 30,
                width: size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 2,
                      width: size.width * 0.35,
                      color: kGrayColor3,
                    ),
                    const Text(
                      " Or ",
                      style: TextStyle(fontFamily: "Poppins", fontSize: 12),
                    ),
                    Container(
                      height: 2,
                      width: size.width * 0.35,
                      color: kGrayColor3,
                    ),
                  ],
                ),
              )),
          Positioned(
              bottom: size.height * 0.085,
              child: Row(
                children: [
                  socialMedia(Image.asset("assets/images/google.png"), () {
                    print("ok");
                  }),
                  const SizedBox(
                    width: 45,
                  ),
                  socialMedia(SvgPicture.asset("assets/images/facebook.svg"),
                      () {
                    print("ok");
                  })
                ],
              )),
          Positioned(
              bottom: size.height * 0.035,
              child: Row(
                children: [
                  const Text(
                    "Don’t have an account yet? ",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  InkWell(
                    onTap: () {
                      print("ok");
                    },
                    child: Text(
                      " Register",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          foreground: Paint()..shader = linearGradient1),
                    ),
                  )
                ],
              ))
        ]),
      ),
    );
  }

  socialMedia(Widget image, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            border: Border.all(color: kGrayColor3, width: 0.8),
            borderRadius: BorderRadius.circular(14)),
        child: Center(child: image),
      ),
    );
  }

  formComponent(
    Size size,
  ) {
    double height = 15;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        alignment: Alignment.topCenter,
        height: size.height * 0.55,
        width: size.width * 0.95,
        child: Form(
            key: formKey,
            child: ListView(
              children: [
                CustomTextFormField(
                  controller: emailController,
                  validator: emailValidator,
                  hintText: "Email",
                  readOnly: false,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/light/Message.svg",
                    color: kGrayColor1,
                  ),
                ),
                SizedBox(
                  height: height,
                ),
                CustomTextFormField(
                  controller: passwordController,
                  validator: passwordValidator,
                  hintText: "Password",
                  readOnly: false,
                  obsecureText: isVisible,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/light/Lock.svg",
                    color: kGrayColor1,
                  ),
                  suffixIcon: suffixIcon(),
                ),
                SizedBox(
                  height: height,
                ),
                Stack(alignment: Alignment.center, children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot your password?",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFADA4A5)),
                      )),
                  Positioned(
                      bottom: 18,
                      child: Container(
                        height: 1,
                        width: 138,
                        color: const Color(0xFFADA4A5),
                      ))
                ])
              ],
            )),
      ),
    );
  }

  suffixIcon() {
    return InkWell(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: isVisible
            ? SvgPicture.asset(
                "assets/icons/light/Hide.svg",
                color: kGrayColor1,
              )
            : SvgPicture.asset(
                "assets/icons/light/open.svg",
                height: 18,
                width: 18,
                color: kGrayColor1,
              ));
  }
}
