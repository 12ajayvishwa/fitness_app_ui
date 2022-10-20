import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/gradient_text_color.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class HeartRate extends StatefulWidget {
  const HeartRate({Key? key}) : super(key: key);

  @override
  State<HeartRate> createState() => _HeartRateState();
}

class _HeartRateState extends State<HeartRate> {
  var data = [0.0,-0.8,0.6,-0.3,0.5,-0.8, 1.0, -1.5, 2.123584, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0,0.0,0.0,0.0];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.23,
      width: size.width * 0.96,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            kBrandColor1.withOpacity(0.3),
            kBrandColor2.withOpacity(0.3)
          ])),
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
            top: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Heart Rate",
                  style: kSmallTextMedium(const Color(0xFF1D1617)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "78 BPM",
                  style: kMediumTextSemiBold(
                      foreground: Paint()..shader = linearGradient1),
                )
              ],
            )),
        Positioned(
          bottom: 15,
          child: Container(
              height: size.height * 0.12,
              width: size.width * 0.96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SfSparkLineChart(
                
                axisLineColor: Colors.transparent,
                color: kBrandColor2,
                trackball: SparkChartTrackball(
                  width: 0,
                  color: Colors.transparent,
                  shouldAlwaysShow: true,
                  activationMode: SparkChartActivationMode.tap
                ),
                data: data,)
              ),
        )
      ]),
    );
  }
}
