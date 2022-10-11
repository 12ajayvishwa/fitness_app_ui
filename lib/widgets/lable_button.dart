import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LableButton extends StatelessWidget {
  final String text;
  const LableButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.12,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), 
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
            kSecondryColor1,
            kSecondryColor2
          ])),
      child: Center(
        child: Text(
          text,
          style: kSmallTextMedium(Colors.white),
        ),
      ),
    );
  }
}
