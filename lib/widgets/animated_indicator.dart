import 'dart:math';
import 'package:fitness_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class AnimatedIndicator extends StatefulWidget {
  final Duration duration;
  final double size;
  final double curveSize;
  final VoidCallback callback;
  const AnimatedIndicator(
      {Key? key,
      required this.duration,
      required this.size,
      required this.callback, required this.curveSize})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedIndicatorState createState() => _AnimatedIndicatorState();
}

class _AnimatedIndicatorState extends State<AnimatedIndicator>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;

  @override
  void initState() {
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = Tween(begin: 0.0, end: 100.0).animate(controller!)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller!.reset();
          widget.callback();
        }
      });
    controller!.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation!,
        builder: (context, child) {
          return CustomPaint(
            size: Size(widget.size, widget.size),
            painter: ProgressPainter(widget.curveSize),
          );
        });
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;
  ProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    var linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..shader = ui.Gradient.linear(
        const Offset(0, 10),
        const Offset(10, 0),
        [kBrandColor1, kBrandColor2],
      );
    var circlePaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        const Offset(0, 10),
        const Offset(10, 0),
        [kBrandColor1, kBrandColor2],
      );

    var radians = (progress / 100) * 2 * pi;
    _drawShape(canvas, linePaint, circlePaint, -pi / 2, radians, size);
  }

  void _drawShape(Canvas canvas, Paint linePaint, Paint circlePaint,
      double startRadian, double sweepRadian, Size size) {
    final centerX = size.width / 2, centerY = size.height / 2;
    final centerOffset = Offset(centerX, centerY);
    final double radius = min(size.width, size.height) / 2;

    canvas.drawArc(Rect.fromCircle(center: centerOffset, radius: radius),
        startRadian, sweepRadian, false, linePaint);
  }

  @override
  // ignore: avoid_renaming_method_parameters
  bool shouldRepaint(CustomPainter old) => true;
}