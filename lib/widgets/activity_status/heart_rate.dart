import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../modal/heart_rate.dart';
import '../../utils/colors.dart';

class HeartRate extends StatefulWidget {
  final Size size;
  const HeartRate({Key? key, required this.size}) : super(key: key);

  @override
  State<HeartRate> createState() => _HeartRateState();
}

class _HeartRateState extends State<HeartRate> {
  late List<ChartData> data;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [
      ChartData(50,20),
      ChartData(55,28),
      ChartData(89,22),
      ChartData(75,20),
      ChartData(68,10),
      ChartData(82,20),
      ChartData(88,21),
      ChartData(73,29),
      ChartData(90,26),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.20,
      width: widget.size.width * 0.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(colors: [
          kBrandColor1.withOpacity(0.2),
          kBrandColor2.withOpacity(0.2)
        ]),
      ),
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
            bottom: 15,
            child: Container(
              height: widget.size.height * 0.10,
              width: widget.size.width * 0.95,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: SfCartesianChart(
                margin: EdgeInsets.all(0),
                borderWidth: 0,
                borderColor: Colors.transparent,
                primaryXAxis: NumericAxis(
                  minimum: 50,
                  maximum: 100,
                  isVisible: false,
                  borderWidth: 0,
                  borderColor: Colors.transparent,
                ),
                primaryYAxis: NumericAxis(
                    minimum: 10,
                    maximum: 20,
                    interval: 12,
                    isVisible: false,
                    borderWidth: 0,
                    borderColor: Colors.transparent),
                series: <ChartSeries<ChartData, int>>[
                  SplineAreaSeries(dataSource: data, xValueMapper: (ChartData data, _) => data.hearRate,yValueMapper: (ChartData data, _) => data.time)
                ],
              ),
            ))
      ]),
    );
  }
}
