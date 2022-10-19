import 'package:fitness_ui/widgets/card_components/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';

class UpcomingWorkoutCard extends StatelessWidget {
  final Size size;
  final String? image;
  final String? title;
  final DateTime? dateTime;
  final bool? status;
  final ValueChanged<bool> onChanged;
  const UpcomingWorkoutCard(
      {Key? key,
      required this.size,
      this.title,
      this.dateTime,
      this.image,
      this.status,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.13,
        width: size.width * 0.98,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15, left: 25),
            child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      kBrandColor1.withOpacity(0.8),
                      kBrandColor2.withOpacity(0.8)
                    ])),
                child: SvgPicture.asset(
                  image!,
                  height: 40,
                  width: 40,
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 27),
              child: SizedBox(
                width: size.width * 0.65,
                height: size.height * 0.09,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 15,
                      left: 12,
                      child: Text(
                        "Fullbody Workout",
                        style: kSmallTextMedium(Colors.black),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      left: 12,
                      child: Text("Today, 03.00pm",
                          style: kCaptionTextRegular(const Color(0xFFA4A9AD))),
                    ),
                    Positioned(
                      right: 0,
                      child: CustomSwitch(
                          key: key,
                          value: status,
                          onChanged: onChanged,
                          ),
                    )
                  ],
                ),
              ))
        ]));
  }
}
