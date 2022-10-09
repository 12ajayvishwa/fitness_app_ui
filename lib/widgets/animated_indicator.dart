import 'dart:math';
import 'package:fitness_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class AnimatedIndicaor extends StatefulWidget {
  final Duration duration;
  final double size;
  final VoidCallback callback;
  const AnimatedIndicaor(
      {Key? key,
      required this.duration,
      required this.size,
      required this.callback})
      : super(key: key);

  @override
  _AnimatedIndicaorState createState() => _AnimatedIndicaorState();
}

class _AnimatedIndicaorState extends State<AnimatedIndicaor>
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
            painter: ProgressPainter(animation!.value),
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
        Offset(0, 10),
        Offset(10, 0),
        [kBrandColor1, kBrandColor2],
      );
    var circlePaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(0, 10),
        Offset(10, 0),
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
  bool shouldRepaint(CustomPainter old) => true;
}
