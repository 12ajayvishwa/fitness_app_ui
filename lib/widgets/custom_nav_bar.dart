import 'package:fitness_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final Size size;
  final Widget svgIcon1;
  final VoidCallback onPressed1;
  final Widget svgIcon2;
  final VoidCallback onPressed2;
  final Widget svgIcon3;
  final VoidCallback onPressed3;
  final Widget svgIcon4;
  final VoidCallback onPressed4;


  
  
  const CustomBottomNavBar({Key? key, required this.size, required this.svgIcon1, required this.onPressed1, required this.svgIcon2, required this.onPressed2, required this.svgIcon3, required this.onPressed3, required this.svgIcon4, required this.onPressed4}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      SizedBox(
        height: size.height * 0.13,
        width: size.width,
      ),
      Positioned(
          bottom: 0,
          child: Container(
            height: size.height * 0.10,
            width: size.width,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width / 2.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: onPressed1,
                        child: svgIcon1,
                        
                        // SvgPicture.asset(
                        //   "assets/icons/light/Home.svg",
                        //   height: 30,
                        //   width: 30,
                        //   color: kGrayColor2,
                        // ),
                      ),
                      InkWell(
                        onTap: onPressed2,
                        child: svgIcon2
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width / 2.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: onPressed3,
                        child: svgIcon3
                      ),
                      InkWell(
                        onTap: onPressed4,
                        child: svgIcon4
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
      Positioned(
          top: 5,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient:
                    const LinearGradient(
                      colors: [kBrandColor2, kBrandColor1]),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xFF95ADFE).withOpacity(0.3),
                      offset: const Offset(0, 10),
                      blurRadius: 10,
                      spreadRadius: 5)
                ]),
            child: Center(
              child: SvgPicture.asset(
                "assets/icons/light/Search.svg",
                color: Colors.white,
              ),
            ),
          ))
    ]);
  }
}
