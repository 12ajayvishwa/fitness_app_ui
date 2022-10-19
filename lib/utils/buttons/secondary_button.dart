import 'package:fitness_ui/utils/text_style.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Size size;
  final double? fontSize;
  final String text;
  final VoidCallback onTap;
  final Color color1;
  final Color color2;
  const SecondaryButton(
      {Key? key, required this.size, required this.text, required this.onTap, required this.color1, required this.color2, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.05,
      width: size.width * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [color2,color1])),
      child: Center(child: Text(text, style: kCaptionTextSemiBold(Colors.white),)),
    );
  }
}
