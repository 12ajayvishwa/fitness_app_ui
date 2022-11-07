import 'package:fitness_ui/utils/buttons/auth_button.dart';
import 'package:fitness_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
              top: 80,
              child:
                  SvgPicture.asset("assets/images/congratulation_image.svg")),
          const Positioned(
              bottom: 300,
              child: Text(
                "Congratulations, You Have \nFinished Your Workout",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              )),
          const Positioned(
              bottom: 250,
              child: Text(
                "Exercises is king and nutrition is queen. Combine the \ntwo and you will have a kingdom",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: kGrayColor1),
              )),
          const Positioned(
              bottom: 220,
              child: Text(
                "-Jack Lalanne",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: kGrayColor1),
              )),
          Positioned(
              bottom: 40,
              child: AuthButton(text: "Back To Home", onTap: () {}, size: size))
        ]),
      ),
    );
  }
}
