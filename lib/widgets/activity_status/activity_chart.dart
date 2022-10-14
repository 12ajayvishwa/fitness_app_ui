import 'package:flutter/material.dart';
class ActivityChart extends StatefulWidget {
  final Size size;
  const ActivityChart({Key? key, required this.size}) : super(key: key);
   List<Color> get availableColors => const <Color>[
        Colors.purpleAccent,
        Colors.yellow,
        Colors.lightBlue,
        Colors.orange,
        Colors.pink,
        Colors.redAccent,
      ];

  @override
  State<ActivityChart> createState() => _ActivityChartState();
}

class _ActivityChartState extends State<ActivityChart> {

  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height*0.35,
      width: widget.size.width*0.96,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(
          color: Color(0xFF1D1617).withOpacity(0.2),
          offset: Offset(0,8),
          spreadRadius: 0.01,
          blurRadius: 8

          
        )]
      ),
    );
  }
}