import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/colors.dart';
import '../../utils/text_style.dart';

class TodayTargetBanner extends StatelessWidget {
  final Size size;
  final VoidCallback? addButton;
  final String? waterIntake;
  final String? footSteps;
  const TodayTargetBanner(
      {Key? key,
      required this.size,
      this.addButton,
      this.waterIntake,
      this.footSteps})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.20,
      width: size.width * 0.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(colors: [
          kBrandColor1.withOpacity(0.2),
          kBrandColor2.withOpacity(0.2)
        ]),
      ),
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
            top: 26,
            left: 20,
            child: AddButton(size: size)),
        const Positioned(
          bottom: 20,
          right: 20,
          child: TargetCard(path: "assets/images/boots 1.svg",title: "Foot Steeps",waterIntake: "2400",)),
        const Positioned(
          bottom: 20,
          left: 20,
          child: TargetCard(path: "assets/images/boots 1.svg",title: "Water Intake",waterIntake: "2L",))
      ])
    );
  }
}

class TargetCard extends StatelessWidget {
  final String path;
  final String? waterIntake;
  final String? footSteps;
  final String title;
  const TargetCard({Key? key, this.waterIntake, this.footSteps, required this.title, required this.path,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
  colors: <Color>[kSecondryColor1, kSecondryColor2],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Container(
      height: 60,
      width: 160,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 34,
            width: 25,
            child: SvgPicture.asset(path),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(waterIntake!,style: TextStyle(fontFamily: "Poppins",fontSize: 14,fontWeight: FontWeight.w500,foreground: Paint()..shader = linearGradient)),
              Text(title,style: const TextStyle(fontFamily: "Poppins",fontSize: 12,color: Color(0xFF7B6F72),fontWeight: FontWeight.w400),)
            ],
          )
        ],
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width/1.18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Today Target",
            style: kSmallTextSemiBold(const Color(0xFF1D1617)),
          ),
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [kBrandColor1, kBrandColor2])),
            child: Center(
              child: SvgPicture.asset("assets/icons/light/plus 1.svg"),
            ),
          )
        ],
      ),
    );
  }
}
