// ignore_for_file: avoid_print

import 'package:fitness_ui/routes/custom_route.dart';
import 'package:fitness_ui/utils/buttons/auth_button.dart';
import 'package:fitness_ui/utils/gradient_text_color.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:fitness_ui/utils/validator.dart';
import 'package:fitness_ui/widgets/custom_text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isVisible = true;
  bool termAndCondition = false;

  void _onTermAndCondition(bool? newValue) {
    setState(() {
      termAndCondition = newValue!;
      if (termAndCondition) {
        print("Accepted");
      } else {
        print("Unaccepted");
      }
    });
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
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
                      "Create an Account",
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
                    Checkbox(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: kGrayColor2, width: 0.8),
                            borderRadius: BorderRadius.circular(5)),
                        activeColor: kBrandColor2,
                        value: termAndCondition,
                        onChanged: _onTermAndCondition))),
            Positioned(
                bottom: size.height * 0.220,
                child: AuthButton(
                    text: "Register",
                    onTap: () {
                      if (formKey.currentState!.validate() &&
                          termAndCondition) {
                        print(termAndCondition);
                        print(firstNameController.text);
                        print(lastNameController.text);
                        print(emailController.text);
                        print(passwordController.text);
                        Navigator.pushNamed(context, registrationOneScreenRoute);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Please accept term and policy")));
                      }
                    },
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
                    socialMedia(Image.asset("assets/images/google.png"),(){
                      print("ok");
                    }),
                    const SizedBox(
                      width: 45,
                    ),
                    socialMedia(SvgPicture.asset("assets/images/facebook.svg"),(){
                      print("ok");
                    }
                    )
                  ],
                )),
            Positioned(
                bottom: size.height * 0.035,
                child: Row(
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                    InkWell(
                      onTap: (){
                        print("ok");
                      },
                      child: Text(
                        " Login",
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
      ),
    );
  }

  socialMedia(Widget image,VoidCallback onTap) {
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

  // ignore: non_constant_identifier_names
  formComponent(Size size, Widget Checkbox) {
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
                  size: size,
                  controller: firstNameController,
                  validator: nameValidator,
                  hintText: "First Name",
                  readOnly: false,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/light/Profile.svg",
                    color: kGrayColor1,
                  ),
                ),
                SizedBox(
                  height: height,
                ),
                CustomTextFormField(
                  controller: lastNameController,
                  validator: nameValidator,
                  hintText: "Last Name",
                  readOnly: false,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/light/Profile.svg",
                    color: kGrayColor1,
                  ),
                ),
                SizedBox(
                  height: height,
                ),
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
                checkBox(Checkbox)
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

  // ignore: non_constant_identifier_names
  Row checkBox(Widget Checkbox) {
    return Row(
      children: [
        Checkbox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text(
                  "By continuing you accept",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFADA4A5)),
                ),
                InkWell(
                    child: Text(
                  " our Privacy Policy",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: kBrandColor2),
                )),
                Text(
                  " and ",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFADA4A5)),
                ),
              ],
            ),
            const InkWell(
                child: Text(
              " Term of Use ",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: kBrandColor2),
            )),
          ],
        ),
      ],
    );
  }
}
