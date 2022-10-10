import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../colors.dart';

class AddCameraButton extends StatelessWidget {
  final Size size;
  final String svgPicture;
  const AddCameraButton(
      {Key? key, required this.svgPicture, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.2,
        width: size.width * 0.2,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [kSecondryColor1, kSecondryColor2])),
        child: Center(
            child: SvgPicture.asset(
          svgPicture,
          color: Colors.white,
        )));
  }
}
