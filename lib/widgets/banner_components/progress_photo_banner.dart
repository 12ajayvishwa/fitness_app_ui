// ignore_for_file: avoid_print

import 'package:fitness_ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/buttons/secondary_button.dart';
import '../../utils/colors.dart';

class ProgressPhotoBanner extends StatelessWidget {
  final Size size;
final String? title;
final String? subTitle;
final VoidCallback? onTap;
  const ProgressPhotoBanner({Key? key, required this.size, this.title, this.subTitle, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height*0.20,
      width: size.width*0.95,
      decoration: BoxDecoration(
  
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(colors: [kBrandColor1.withOpacity(0.2),kBrandColor2.withOpacity(0.2)]),),
      
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 26,
            left: 20,
            child: RichText(text: TextSpan(text:"Track Your Progress Each\nMonth With",style: kSmallTextSemiBold(Colors.black),children: [
              TextSpan(text: "  Photo",style: kSmallTextSemiBold(kBrandColor1))
            ]),),),
            Positioned(
              top: 20,
              right: 20,
              bottom: 20,
              child: SvgPicture.asset("assets/images/Vector.svg")),
              Positioned(
                bottom: 26,
                left: 20,
                child: SecondaryButton(size: size, text: "Learn More", onTap: (){print("hi");},color1: kSecondryColor1,color2: kSecondryColor2,))
      ]),
    );
 
  }
}