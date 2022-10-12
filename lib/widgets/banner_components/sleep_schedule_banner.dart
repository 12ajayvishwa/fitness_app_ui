import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/buttons/secondary_button.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';

class SleepScheduleBanner extends StatelessWidget {
  final Size size;
final String? title;
final String? subTitle;
final VoidCallback? onTap;
  const SleepScheduleBanner({Key? key, required this.size, this.title, this.subTitle, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final Shader linearGradient = LinearGradient(
  colors: <Color>[
    kBrandColor1, kBrandColor1],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ideal Hours for Sleep",style: kSmallTextRegular(Colors.black),),
                Text("8hours 30minutes",style: TextStyle(fontFamily: "Poppins",fontSize: smallTextSize,foreground: Paint()..shader = linearGradient)),
              ],
            ),),
            Positioned(
              top: 20,
              right: 20,
              bottom: 20,
              child: SvgPicture.asset("assets/images/Layer 1.svg")),
              Positioned(
                bottom: 26,
                left: 20,
                child: SecondaryButton(size: size, text: "Learn More", onTap: (){print("hi");},color1: kSecondryColor1,color2: kSecondryColor2,))
      ]),
    );
  }
}