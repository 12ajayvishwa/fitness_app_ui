import 'package:flutter/material.dart';
class ActivityChart extends StatelessWidget {
  final Size size;
  const ActivityChart({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height*0.35,
      width: size.width*0.96,
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