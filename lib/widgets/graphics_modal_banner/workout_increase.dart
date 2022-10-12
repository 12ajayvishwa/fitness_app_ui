import 'dart:core';

import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/widgets/animated_indicator.dart';
import 'package:fitness_ui/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkoutIncrease extends StatelessWidget {
  final Size size;
  final DateTime? dateTime;
  final double? percent;
  final String? title;
  final double? percentIncrease;
  const WorkoutIncrease(
      {Key? key,
      required this.size,
      this.dateTime,
      this.percent,
      this.title,
      this.percentIncrease})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.09,
      width: size.width * 0.375,
      decoration: BoxDecoration(
        color: Colors.white,
           borderRadius: BorderRadius.circular(8),
          ),
           
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              width: size.width * 0.5,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Fri, 28 May",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: kGrayColor2,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          "91% ",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: kSuccessColor),
                        ),
                        SvgPicture.asset(
                          "assets/icons/light/Arrow - Up.svg",
                          height: 10,
                          width: 10,
                          color: kSuccessColor,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            top: 28,
            left: 10,
            child: Text("Upperbody Workout",style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: kGrayColor1,
                      ),)),
          const Positioned(
            top: 52,
            left: 4,
            child: ProgressBar(percent: 0.2,lineHeight: 7,width: 110,radius: 5,))
        ],
      ),
    );
  }
}
