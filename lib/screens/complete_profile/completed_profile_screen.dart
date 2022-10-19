import 'package:fitness_ui/utils/buttons/auth_button.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompletedProfileScreen extends StatefulWidget {
  const CompletedProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompletedProfileScreen> createState() => _CompletedProfileScreenState();
}

class _CompletedProfileScreenState extends State<CompletedProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
              bottom: size.height * 0.06,
              child: AuthButton(text: "Go To Home", onTap: () {}, size: size)),
          Positioned(top: size.height * 0.130, child: centerImage(size)),
          Positioned(
              bottom: size.height * 0.3,
              child: SizedBox(
                height: size.height * 0.13,
                width: size.width * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Welcome, Stefani",
                      style: kTitleH4Bold(const Color(0xFF1D1617)),
                    ),
                    Text(
                      "You are all set now, let’s reach your \ngoals together with us",
                      textAlign: TextAlign.center,
                      style: kSmallTextRegular(const Color(0xFF7B6F72)),
                    )
                  ],
                ),
              ))
        ]),
      ),
    );
  }

  SizedBox centerImage(Size size) {
    return SizedBox(
      height: size.height * 0.4,
      child: Stack(alignment: Alignment.center, children: [
        SvgPicture.asset("assets/images/complete-profile.svg"),
        Positioned(
            top: size.height * 0.06,
            right: size.width * 0.150,
            child:
                SvgPicture.asset("assets/images/complete-profile-lady_2_.svg")),
        Positioned(
            top: size.height * 0.03,
            left: size.width * 0.08,
            child:
                SvgPicture.asset("assets/images/complete-profile-man_2_.svg")),
      ]),
    );
  }
}
