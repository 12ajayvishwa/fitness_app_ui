import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../progress_bar.dart';

class LatestWorkoutCard extends StatefulWidget {
  final Size size;
  final String? image;
  final String? title;
  final num? caloriesBurn;
  final Color? gradientColor1;
  final Color? gradientColor2;
  final Color? textColor;
  final String? time;
  final double? percent;
  final VoidCallback? onTab;
  const LatestWorkoutCard(
      {Key? key,
      this.image,
      this.title,
      this.onTab,
      this.caloriesBurn,
      this.time,
      required this.size, this.gradientColor1, this.gradientColor2, this.textColor, this.percent})
      : super(key: key);

  @override
  State<LatestWorkoutCard> createState() => _LatestWorkoutCardState();
}

class _LatestWorkoutCardState extends State<LatestWorkoutCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.13,
      width: widget.size.width * 0.98,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    widget.gradientColor1!,
                    widget.gradientColor2!
                    // kBrandColor1.withOpacity(0.8),
                    // kBrandColor2.withOpacity(0.8)
                  ])),
              child: SvgPicture.asset(
                widget.image!,
                height: 50,
                width: 50,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
              width: widget.size.width * 0.65,
              height: widget.size.height * 0.09,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 8,
                    left: 12,
                    child: Text(
                      widget.title!,
                      //"Fullbody Workout",
                      style: kSmallTextMedium(widget.textColor!),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("${widget.caloriesBurn} Calories Burn ",
                            style:
                                kCaptionTextRegular(const Color(0xFFA4A9AD))),
                        Container(
                          height: 10,
                          width: 1,
                          color: Colors.grey,
                        ),
                        Text(widget.time!,
                            style:
                                kCaptionTextRegular(const Color(0xFFA4A9AD))),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 7,
                      child: ProgressBar(
                        percent: widget.percent!,
                        width: 180,
                        lineHeight: 10,
                        radius: 50,
                      )

                      // LinearPercentIndicator(
                      //   width: 191.0,
                      //   lineHeight: 10.0,
                      //   percent: 0.5,
                      //   animation: true,
                      //   animationDuration: 1500,
                      //   backgroundColor: const Color(0xFFF7F8F8),
                      //   progressColor: kBrandColor1,
                      //   barRadius: Radius.circular(50),
                      // ),
                      ),
                  Positioned(
                    right: 0,
                    child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: kSecondryColor2, width: 1.5),
                          // gradient: LinearGradient(colors: [
                          //       kSecondryColor1,
                          //       kSecondryColor2
                          //     ])
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/light/Arrow - Right 2.svg",
                          color: kSecondryColor2,
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
