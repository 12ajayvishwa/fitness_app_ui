import 'dart:math';
import 'package:fitness_ui/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HeartRate extends StatefulWidget {
  const HeartRate({Key? key}) : super(key: key);

  @override
  State<HeartRate> createState() => _HeartRateState();
}

class _HeartRateState extends State<HeartRate> {
  void startCreatingDemoData() async {
    for (int i = 0; i < 7; i++) {
      if (i == 0) continue;
      await Future.delayed((Duration(seconds: 1))).then((value) {
        Random random = Random();

        flspots.add(FlSpot(
          double.parse(i.toString()),
          random.nextDouble() * 6,
        ));
        setState(() {
          setChartData();
        });
      });
    }
  }

  LineChartData data = LineChartData();

  void setChartData() {
    data = LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: kGrayColor1.withOpacity(0.2),
              strokeWidth: 2,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(color: kBrandColor2, strokeWidth: 1);
          },
        ),
        titlesData: LineTitles.getTitleData(),
        borderData: FlBorderData(
            show: false, border: Border.all(color: kBrandColor2, width: 1)),
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
              spots: flspots,
              isCurved: false,
              colors: gradientColors,
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: false,
                getDotPainter:(p0, p1, p2, p3) => FlDotCirclePainter(
                  radius: 4,
                  color: Colors.white,
                  strokeWidth: 2,
                  strokeColor: kBrandColor2
                ),
              ),
              // shadow: Shadow(color: kSecondryColor1,
              // offset: Offset(0,2),
              // blurRadius: 10,s

              belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColors2,
                  // .map((color) => color.withOpacity(0.2))
                  // .toList(),
                  gradientColorStops: [0, 0.5, 1.0],
                  gradientFrom: const Offset(0, 0),
                  gradientTo: const Offset(0, 2)))
        ]);
  }

  List<FlSpot> flspots = [
    FlSpot(0, 0),
  ];

  List<Color> gradientColors = [kBrandColor1, kBrandColor2];
  List<Color> gradientColors2 = [kBrandColor2.withOpacity(0.4), Colors.white];
  @override
  void initState() {
    super.initState();
    setChartData();
    startCreatingDemoData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: size.width * 0.96,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Stack(alignment: Alignment.center, children: [
        SizedBox(
            height: size.height * 0.28,
            width: size.width * 0.85,
            child: LineChart(data)),
      ]),
    );
  }
}

class LineTitles {
  static getTitleData() => FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: kGrayColor1),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return "Sun";
              case 1:
                return "Mon";
              case 2:
                return "Tue";
              case 3:
                return "Wed";
              case 4:
                return "Thu";
              case 5:
                return "Fri";
              case 6:
                return "Sat";
            }

            return '';
          },
          margin: 22),
      leftTitles: SideTitles(showTitles: false),
      rightTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: kGrayColor1),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return "0h";
              case 1:
                return "2h";
              case 2:
                return "4h";
              case 3:
                return "6h";
              case 4:
                return "8h";
              case 5:
                return "10h";
            }

            return '';
          },
          margin: 22));
}
