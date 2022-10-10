import 'package:fitness_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingButton extends StatelessWidget {
  final VoidCallback onNext;
  const OnBoardingButton({Key? key, required this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: Stack(children: [
        Center(
          child: GestureDetector(
            onTap: onNext,
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient:
                      LinearGradient(colors: [kBrandColor1, kBrandColor2])),
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/light/Arrow - Right 2.svg",
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
