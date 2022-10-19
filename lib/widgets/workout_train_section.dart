import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';

class WorkoutTrainSection extends StatelessWidget {
  final Size size;
  final String? title;
  final String? subTitle;
  final VoidCallback? onTap;
  const WorkoutTrainSection(
      {Key? key, required this.size, this.title, this.subTitle, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[kBrandColor1, kBrandColor1],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Container(
      height: size.height * 0.20,
      width: size.width * 0.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(colors: [
          kBrandColor1.withOpacity(0.2),
          kBrandColor2.withOpacity(0.2)
        ]),
      ),
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
          top: 26,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ideal Hours for Sleep",
                style: kSmallTextRegular(Colors.black),
              ),
              const Text("8hours 30minutes",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12,
                      color: kGrayColor1,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
        Positioned(
            top: 20,
            right: 20,
            bottom: 20,
            child: Container(
              height: 92,
              width: 92,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white.withOpacity(0.3)),
              child: SvgPicture.asset(
                "assets/images/Train_Vector1.svg",
                height: 105.93,
                width: 74.12,
              ),
            )),
        Positioned(
            bottom: 26,
            left: 20,
            child: Container(
                height: size.height * 0.05,
                width: size.width * 0.25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text("View More",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          foreground: Paint()..shader = linearGradient)),
                )))
      ]),
    );
  }
}
