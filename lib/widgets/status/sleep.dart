import 'package:flutter/material.dart';
import '../../utils/gradient_text_color.dart';
import '../../utils/text_style.dart';

class Sleep extends StatelessWidget {
  const Sleep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
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
                  height: 65,
                  width: 150,
                  child: Image.asset(
                    "assets/images/Sleep-Graph.png",
                    fit: BoxFit.cover,
                  )))
        ],
      ),
    );
  }
}
