import 'package:fitness_ui/utils/gradient_text_color.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../utils/colors.dart';

class WaterIntakeTimeLine extends StatefulWidget {
  final Size size;
  final String? time;
  const WaterIntakeTimeLine({Key? key, required this.size, this.time})
      : super(key: key);

  @override
  State<WaterIntakeTimeLine> createState() => _WaterIntakeTimeLineState();
}

class _WaterIntakeTimeLineState extends State<WaterIntakeTimeLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.28,
      width: widget.size.width * 0.28,
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              SizedBox(
                height: widget.size.height * 0.06,
                width: widget.size.width * 0.5,
                child: timeLineList("Average Heart Rate", "78 BPM",
                    isFirst: false, isLast: false),
              ),
              SizedBox(
                height: widget.size.height * 0.06,
                width: widget.size.width * 0.5,
                child: timeLineList("Total Foot Steps", "1400 Steps",
                    isFirst: false, isLast: false),
              ),
              SizedBox(
                height: widget.size.height * 0.06,
                width: widget.size.width * 0.5,
                child: timeLineList("Water Intake", "4000ml",
                    isFirst: false, isLast: false),
              ),
              SizedBox(
                height: widget.size.height * 0.06,
                width: widget.size.width * 0.5,
                child: timeLineList("Hours of Sleep", "8h 20m",
                    isFirst: false, isLast: false),
              ),
              SizedBox(
                height: widget.size.height * 0.06,
                width: widget.size.width * 0.5,
                child: timeLineList("Total Calories", "3000 calories",
                    isFirst: false, isLast: true),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  TimelineTile timeLineList(String title, String subtitle,
      {bool? isFirst, bool? isLast}) {
    return TimelineTile(
      indicatorStyle: customIndicator(),
      
      beforeLineStyle: const LineStyle(color: kSecondryColor1, thickness: 2),
      afterLineStyle: const LineStyle(color: kSecondryColor1, thickness: 2),
      endChild: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              //"Average Heart Rate",
              style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 8,
                  color: kGrayColor2),
            ),
            Text(
              subtitle,
              //"78 BPM",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 8,
                  foreground: Paint()..shader = linearGradient1),
            ),
          ],
        ),
      ),
      isFirst: isFirst!,
      isLast: isLast!,
    );
  }

  IndicatorStyle customIndicator() {
    return IndicatorStyle(
        height: 10,
        width: 10,
        indicator: Container(
          height: 10,
          width: 10,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [kSecondryColor1, kSecondryColor2])),
        ));
  }
}
