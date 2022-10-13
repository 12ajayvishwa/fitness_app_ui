import 'package:fitness_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ActivityTimeLine extends StatefulWidget {
  final Size size;
  final String? time;
  const ActivityTimeLine({Key? key, required this.size, this.time})
      : super(key: key);

  @override
  State<ActivityTimeLine> createState() => _ActivityTimeLineState();
}

class _ActivityTimeLineState extends State<ActivityTimeLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.45,
      width: widget.size.width * 0.55,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 0.2,
                spreadRadius: 0.6,
                color: const Color(0xFF1D1617).withOpacity(0.04))
          ]),
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
            top: 20,
            left: 15,
            child: Text(
              widget.time!,
              style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: kGrayColor1),
            )),
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
      beforeLineStyle: const LineStyle(color: kBrandColor2, thickness: 2),
      afterLineStyle: const LineStyle(color: kBrandColor2, thickness: 2),
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
                  fontSize: 10,
                  color: Colors.black),
            ),
            Text(
              subtitle,
              //"78 BPM",
              style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 8,
                  color: kGrayColor1),
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
        indicator: Container(
      height: 25,
      width: 25,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          border: GradientBoxBorder(
              gradient: LinearGradient(colors: [kBrandColor1, kBrandColor2]),
              width: 2)),
      child: Stack(alignment: Alignment.center, children: [
        Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              gradient:
                  const LinearGradient(colors: [kBrandColor1, kBrandColor2])),
        )
      ]),
    ));
  }
}
