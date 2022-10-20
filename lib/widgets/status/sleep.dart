import 'package:flutter/material.dart';
import '../../utils/gradient_text_color.dart';
import '../../utils/text_style.dart';

class Sleep extends StatelessWidget {
  final Size size;
  const Sleep({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height*0.2,
      width: size.width*0.4,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF1D1617).withOpacity(0.2),
                offset: const Offset(1, 4),
                spreadRadius: 4,
                blurRadius: 6)
          ]),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 15,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Calories",
                    style: kSmallTextMedium(const Color(0xFF1D1617)),
                  ),
                  Text("760 kCal",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: mediumTextSize,
                          fontWeight: FontWeight.w600,
                          foreground: Paint()..shader = linearGradient2))
                ],
              )),
          Positioned(
              bottom: 15,
              child: SizedBox(
                  height: 75,
                  width: 165,
                  child: Image.asset(
                    "assets/images/Sleep-Graph.png",
                    fit: BoxFit.cover,
                  )))
        ],
      ),
    );
  }
}
