import 'package:fitness_ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class SecondaryButton extends StatelessWidget {
  final Size size;
  final String text;
  final VoidCallback onTap;
  const SecondaryButton(
      {Key? key, required this.size, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.05,
        width: size.width * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: const LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [kSecondryColor1, kSecondryColor2])),
        child: Center(
            child: Text(
          text,
          style: kCaptionTextSemiBold,
        )));
  }
}
