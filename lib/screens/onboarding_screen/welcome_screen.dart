import 'package:fitness_ui/routes/custom_route.dart';
import 'package:fitness_ui/utils/buttons/auth_button.dart';
import 'package:fitness_ui/utils/colors.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          color: const Color(0xFFFFFFFF),
          child: Stack(alignment: Alignment.center, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/FitnestX.png"),
                const Text(
                  "Everybody Can Train",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: kGrayColor1),
                ),
              ],
            ),
            Positioned(
                bottom: 25,
                child: AuthButton(
                  onTap: () {
                    Navigator.pushNamed(context, onboardingScreenRoute);
                  },
                  text: "Get Started",
                  size: size,
                ))
          ]),
        ),
      ),
    );
  }
}
