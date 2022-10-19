import 'package:fitness_ui/utils/colors.dart';
import 'package:flutter/material.dart';

class DailyAction extends StatelessWidget {
  final Size size;
  final String title;
  final String buttonText;
  final VoidCallback onTab;
  const DailyAction({Key? key, required this.title, required this.onTab, required this.size, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height*0.1,
      width: size.width*0.96,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [kBrandColor1.withOpacity(0.3),kBrandColor2.withOpacity(0.4)])
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: const TextStyle(
              fontFamily: "Poppins",fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black
            ),),
           Button(size: size, text: buttonText, onTap:onTab,color1: kBrandColor1,color2: kBrandColor2,)
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final Size size;
  final double? fontSize;
  final String text;
  final VoidCallback onTap;
  final Color color1;
  final Color color2;
  const Button(
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
      child: Center(child: Text(text, style: const TextStyle(fontFamily: "Poppins",fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white,letterSpacing: 1,)),
    ));
  }
}
