import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ProgressBar extends StatelessWidget {
  final double width;
  final double lineHeight;
  final double percent;
  final double radius;
  const ProgressBar({
    Key? key, required this.percent, required this.width, required this.lineHeight, required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFProgressBar(
     width: width,
     lineHeight: lineHeight,
    animation: true,
    percentage: percent,
    animationDuration: 1500,
    radius: radius,
    
    backgroundColor: const Color(0xFFF7F8F8),
    linearGradient: const LinearGradient(colors: [
      Color(0xFFC58BF2),Color(0xFF92A3FD)
    ]),
    );
  }
}