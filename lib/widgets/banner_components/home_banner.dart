import 'package:fitness_ui/utils/buttons/secondary_button.dart';
import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
final Size size;
final String? title;
final String? subTitle;
final VoidCallback? onTap;
  const HomeBanner({Key? key, required this.size, this.title,this.subTitle, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height*0.20,
      width: size.width*0.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(colors: [kBrandColor1,kBrandColor2]),
        image: DecorationImage(image: AssetImage("assets/images/Dots.png"),fit: BoxFit.cover)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 26,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("BMI (Body Mass Index)",style: kMediumTextSemiBold,),
                const SizedBox(height: 5,),
                Text("You have a normal weight",style: kSmallTextRegular(Colors.white),)
              ],
            )),
            Positioned(
              top: 20,
              right: 0,
              bottom: 0,
              child: Container(
                height: size.height*0.6,
                width: size.width*0.45,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/Banner-Pie.png",),fit: BoxFit.cover)
                ),
                )),
              Positioned(
                bottom: 26,
                left: 20,
                child: SecondaryButton(size: size, text: "View More", onTap: (){print("hi");},color1: kSecondryColor1,color2: kSecondryColor2,))
      ]),
    );
  }
}