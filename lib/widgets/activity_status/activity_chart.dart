import 'package:fitness_ui/utils/colors.dart';
import 'package:flutter/material.dart';

class ActivityChart extends StatefulWidget {
  final Size size;
  const ActivityChart({Key? key, required this.size}) : super(key: key);

  @override
  State<ActivityChart> createState() => _ActivityChartState();
}

class _ActivityChartState extends State<ActivityChart> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var textStyle = TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: kGrayColor1);
    return Container(
      height: widget.size.height * 0.35,
      width: widget.size.width * 0.96,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Color(0xFF1D1617).withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2)
          ]),
      child: Stack(children: [
        Positioned(
          bottom: 10,
          left: 30,
          child: SizedBox(
            height: widget.size.height * 0.05,
            width: widget.size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sun",
                  style: textStyle,
                ),
                Text(
                  "Mun",
                  style: textStyle,
                ),
                Text(
                  "Tue",
                  style: textStyle,
                ),
                Text(
                  "Wed",
                  style: textStyle,
                ),
                Text(
                  "Thu",
                  style: textStyle,
                ),
                Text(
                  "Fri",
                  style: textStyle,
                ),
                Text(
                  "Sat",
                  style: textStyle,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 60,
          left: 30,
          child: SizedBox(
            height: widget.size.height * 0.25,
            width: widget.size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RodData(size: size, fillSize: 0.08,gradient: const LinearGradient(colors: [kSecondryColor1,kSecondryColor2]),),
                RodData(size: size, fillSize: 0.18,gradient: const LinearGradient(colors: [kBrandColor1,kBrandColor2]),),
                RodData(size: size, fillSize: 0.1,gradient: const LinearGradient(colors: [kSecondryColor1,kSecondryColor2]),),
                RodData(size: size, fillSize: 0.12,gradient: const LinearGradient(colors: [kBrandColor1,kBrandColor2]),),
                RodData(size: size, fillSize: 0.02,gradient: const LinearGradient(colors: [kSecondryColor1,kSecondryColor2]),),
                RodData(size: size, fillSize: 0.07,gradient: const LinearGradient(colors: [kBrandColor1,kBrandColor2]),),
                RodData(size: size, fillSize: 0.2,gradient: const LinearGradient(colors: [kSecondryColor1,kSecondryColor2]),)
              ],
            ),
          ))
      ]),
    );
  }
}

class RodData extends StatelessWidget {
  final Size size;
  final Gradient gradient;
  final num fillSize;
  const RodData({Key? key, required this.size, required this.fillSize, required this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.3,
      width: size.width * 0.06,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F8),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
        Container(
          height: size.height * fillSize,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: gradient,
            ),
        )
      ]),
    );
  }
}
