import 'dart:math';

import 'package:fitness_ui/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WorkOutChart2 extends StatefulWidget {
  const WorkOutChart2({Key? key}) : super(key: key);

  @override
  State<WorkOutChart2> createState() => _WorkOutChart2State();
}

class _WorkOutChart2State extends State<WorkOutChart2> {
  void startCreatingDemoData1() async {
    for (int i = 0; i < 7; i++) {
      if (i == 0) continue;
      await Future.delayed((Duration(seconds: 1))).then((value) {
        Random random = Random();

        flspots1.add(FlSpot(
          double.parse(i.toString()),
          random.nextDouble() * 6,
        ));
        setState(() {
          setChartData();
        });
      });
    }
  }
  void startCreatingDemoData2() async {
    for (int i = 0; i < 7; i++) {
      if (i == 0) continue;
      await Future.delayed((Duration(seconds: 1))).then((value) {
        Random random = Random();

        flspots2.add(FlSpot(
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
              color: Colors.white.withOpacity(0.2),
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
            spots: flspots2,
            isCurved: true,
            colors: [Colors.white.withOpacity(0.3)],
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false)
          ),
          
          LineChartBarData(
            spots: flspots1,
            isCurved: true,
            colors: gradientColors,
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
              getDotPainter: (p0, p1, p2, p3) => FlDotCirclePainter(
                  radius: 4,
                  color: Colors.white,
                  strokeWidth: 2,
                  strokeColor: kBrandColor2),
            ),
          ),
          
          // shadow: Shadow(color: kSecondryColor1,
          // offset: Offset(0,2),
          // blurRadius: 10,s

          // belowBarData: BarAreaData(
          //     show: true,
          //     colors: gradientColors2,
          //     // .map((color) => color.withOpacity(0.2))
          //     // .toList(),
          //     gradientColorStops: [0, 0.5, 1.0],
          //     gradientFrom: const Offset(0, 0),
          //     gradientTo: const Offset(0, 2)))
        ]);
  }

  List<FlSpot> flspots1 = [
    FlSpot(0, 3),
  ];
  List<FlSpot> flspots2 = [
    FlSpot(0, 2),
  ];

  List<Color> gradientColors = [Colors.white.withOpacity(0.6)];
  
  @override
  void initState() {
    super.initState();
    setChartData();
    startCreatingDemoData1();
    startCreatingDemoData2();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
       height: size.height*0.35,
      width: size.width*0.96,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [kBrandColor1,kBrandColor2])
      ),
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
              color: Colors.white),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return "Jan";
              case 1:
                return "Feb";
              case 2:
                return "Mar";
              case 3:
                return "Apr";
              case 4:
                return "May";
              case 5:
                return "Jun";
              case 6:
                return "Jul";
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
              color: Colors.white),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return "0%";
              case 1:
                return "20%";
              case 2:
                return "40%";
              case 3:
                return "60%";
              case 4:
                return "80%";
              case 5:
                return "100%";
            }

            return '';
          },
          margin: 22));
}
