import 'package:fitness_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../text_style.dart';

class AuthButton extends StatelessWidget {
  final Size size;
  final String text;
  final VoidCallback onTap;
  final IconData? icon;
  final String? svgPicture1;
  final String? svgPicture2;
  const AuthButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.icon,
    required this.size,
    this.svgPicture1,
    this.svgPicture2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.06,
        width: size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            gradient: const LinearGradient(colors: [kBrandColor1, kBrandColor2]),
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFF95ADFE).withOpacity(0.3),
                  offset: const Offset(0, 10),
                  blurRadius: 10)
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgPicture1 ?? "",
              color: Colors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(text, style: kLargeTextBold),
            const SizedBox(
              width: 5,
            ),
            SvgPicture.asset(
              svgPicture2 ?? "",
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
