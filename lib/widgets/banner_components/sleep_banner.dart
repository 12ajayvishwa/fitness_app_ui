import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';

class SleepBanner extends StatelessWidget {
  final Size size;
  final String? title;
  final String? subTitle;

  const SleepBanner({Key? key, this.title, this.subTitle, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.20,
      width: size.width * 0.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(colors: [kBrandColor1, kBrandColor2]),
        // image: DecorationImage(image: AssetImage("assets/images/White-Graph.png"),fit: BoxFit.contain)
      ),
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
          top: 26,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Last Night Sleep",
                style: kMediumTextSemiBold,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "8h 20m",
                style: kSmallTextRegular(Colors.white),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Image.asset("assets/images/White-Graph.png",fit: BoxFit.contain,width: size.width,)),
           Positioned(
          bottom: 0,
          child: Image.asset("assets/images/Overlay.png",fit: BoxFit.contain,width: size.width,))
      ]),
    );
  }
}
