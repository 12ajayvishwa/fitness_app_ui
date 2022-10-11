import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ProgressBar extends StatelessWidget {
  final double percent;
  const ProgressBar({
    Key? key, required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFProgressBar(
     width: 191.0,
     lineHeight: 10.0,
    animation: true,
    percentage: 0.8,
    animationDuration: 1500,
    radius: 50,
    backgroundColor: const Color(0xFFF7F8F8),
    linearGradient: const LinearGradient(colors: [
      Color(0xFFC58BF2),Color(0xFF92A3FD)
    ]),
    );
  }
}