import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/gradient_text_color.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Calories extends StatefulWidget {
  final Size size;
  const Calories({Key? key, required this.size}) : super(key: key);

  @override
  State<Calories> createState() => _CaloriesState();
}

class _CaloriesState extends State<Calories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Color(0xFF1D1617).withOpacity(0.2),
                offset: Offset(1, 4),
                spreadRadius: 4,
                blurRadius: 6)
          ]),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 15,
              left: 10,
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
          Positioned(bottom: 15, child: CaloriesProgressBar())
        ],
      ),
    );
  }
}

class CaloriesProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      width: 66,
      child: GFProgressBar(
        circleWidth: 8,
        circleStartAngle: 180,
        animation: true,
        percentage: 0.6,
        animationDuration: 1500,
        radius: 75,
        progressHeadType: GFProgressHeadType.circular,
        type: GFProgressType.circular,
        backgroundColor: const Color(0xFFF7F8F8),
        linearGradient: const LinearGradient(
            colors: [Color(0xFFC58BF2), Color(0xFF92A3FD)]),
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [kBrandColor1, kBrandColor2])),
          child: const Center(
            child:  Text(
              "230kCal\nleft",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
