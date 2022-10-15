import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/widgets/status/water_intake_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/gradient_text_color.dart';
import '../../utils/text_style.dart';

class WaterIntake extends StatefulWidget {
  const WaterIntake({Key? key}) : super(key: key);

  @override
  State<WaterIntake> createState() => _WaterIntakeState();
}

class _WaterIntakeState extends State<WaterIntake> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 350,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Color(0xFF1D1617).withOpacity(0.15),
                offset: Offset(1, 4),
                spreadRadius: 4,
                blurRadius: 6),
          ]),
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
            left: 10,
            child: RodData(
                size: size,
                fillSize: 0.3,
                gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [kBrandColor1, kSecondryColor2]))),
        Positioned(
            top: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Calories",
                  style: kSmallTextMedium(const Color(0xFF1D1617)),
                ),
                Text("760 kCal",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: mediumTextSize,
                        fontWeight: FontWeight.w600,
                        foreground: Paint()..shader = linearGradient2))
              ],
            )),
          Positioned(
            top: 75,
            right: 15,
            child: Text("Real time updates",style: kCaptionTextRegular(kGrayColor1),)),
          Positioned(
            bottom: 10,
            right: 15,
            child: WaterIntakeTimeLine(size: size,time: "12",))
      ]),
    );
  }
}

class RodData extends StatelessWidget {
  final Size size;
  final Gradient gradient;
  final num fillSize;
  const RodData(
      {Key? key,
      required this.size,
      required this.fillSize,
      required this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4,
      width: size.width * 0.04,
      decoration: BoxDecoration(
          color: const Color(0xFFF7F8F8),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          height: size.height * fillSize,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            gradient: gradient,
          ),
        ),
      ]),
    );
  }
}
