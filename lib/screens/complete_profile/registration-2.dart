import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_ui/screens/onboarding_screen/onboarding_screen.dart';
import 'package:fitness_ui/utils/buttons/auth_button.dart';
import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Registration2 extends StatefulWidget {
  const Registration2({Key? key}) : super(key: key);

  @override
  State<Registration2> createState() => _Registration2State();
}

class _Registration2State extends State<Registration2> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: size.height * 0.05,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "What is your goal ?",
                      style: kTitleH4Bold(const Color(0xFF1D1617)),
                    ),
                    Text(
                      "It will help us to choose a best \nprogram for you",
                      textAlign: TextAlign.center,
                      style: kSmallTextRegular(const Color(0xFF7B6F72)),
                    )
                  ],
                )),
            Positioned(
                child: CarouselSlider(
                    carouselController: _controller,
                    items: [
                      Slides(
                        size: size,
                        image: "assets/images/slide_vector.svg",
                        title: "Improve Shape",
                        subtitle:
                            "I have a low amount of body fat \nand need / want to build \nmore muscle",
                      ),
                      Slides(
                        size: size,
                        image: "assets/images/slide_vector2.svg",
                        title: "Lean & Tone",
                        subtitle:
                            "I’m “skinny fat”. look thin but have \nno shape. I want to add learn \nmuscle in the right way",
                      ),
                      Slides(
                        size: size,
                        image: "assets/images/slide_vector3.svg",
                        title: "Lose a Fat",
                        subtitle:
                            "I have over 20 lbs to lose. I want to \ndrop all this fat and gain muscle \nmass",
                      )
                    ],
                    options: CarouselOptions(
                        autoPlay: true,
                        height: size.height * 0.7,
                        autoPlayCurve: Curves.easeInOut,
                        enlargeCenterPage: true,
                        viewportFraction: 0.78,
                        pauseAutoPlayOnTouch: true))),
            Positioned(
                bottom: size.height * 0.06,
                child: AuthButton(
                  onTap: () {},
                  text: "Confirm",
                  size: size,
                ))
          ],
        ),
      ),
    );
  }
}

class Slides extends StatelessWidget {
  final Size size;
  final String image;
  final String title;
  final String? subtitle;
  const Slides(
      {Key? key,
      required this.size,
      required this.image,
      required this.title,
      this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.7,
      width: size.width * 0.75,
      child: Stack(alignment: Alignment.center, children: [
        Container(
          height: size.height * 0.62,
          width: size.width * 0.75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: const LinearGradient(
                colors: [kBrandColor1, kBrandColor2],
              ),
              boxShadow: [
                BoxShadow(
                    color: const Color(0xFFC58BF2).withOpacity(0.2),
                    offset: const Offset(0, 8),
                    blurRadius: 6,
                    spreadRadius: 2)
              ]),
          child: Stack(alignment: Alignment.center, children: [
            Positioned(top: size.height * 0.04, child: SvgPicture.asset(image)),
            Positioned(
                bottom: size.height * 0.12,
                child: Column(
                  children: [
                    Text(
                      title,
                      style:
                          kMediumTextSemiBold(color: const Color(0xFFFFFFFF)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 1.5,
                      width: size.height * 0.06,
                      color: const Color(0xFFF7F8F8),
                    )
                  ],
                )),
            Positioned(
                bottom: size.height * 0.02,
                child: Text(
                  subtitle!,
                  textAlign: TextAlign.center,
                  style: kSmallTextRegular(const Color(0xFFFFFFFF)),
                ))
          ]),
        ),
      ]),
    );
  }
}
