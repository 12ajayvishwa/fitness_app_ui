import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';
import '../progress_bar.dart';

class Meals extends StatelessWidget {
  final Size size;
  final String title;
  final double percent;
  final Color color;
  final String path;
  final double progressPercent;
  const Meals({Key? key, required this.title, required this.percent, required this.progressPercent, required this.size, required this.color, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
      height: size.height * 0.06,
      width: size.width * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
           borderRadius: BorderRadius.circular(8),
          ),
           
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 10,
            right: 10,
            bottom: 10,
            child: Container(
              width: size.width * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(
                    title,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: kGrayColor1,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "$percent%",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: color),
                      ),
                      SvgPicture.asset(
                        path,
                        height: 10,
                        width: 10,
                        color: color,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          Positioned(
            bottom: 10,
            left: 4,
            child: ProgressBar(percent: progressPercent,lineHeight: 7,width: 80,radius: 5,))
        ],
      ),
    );
  }
}