import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/widgets/animated_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController(initialPage: 0);

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(seconds: 2), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: PageView(
              controller: pageController,
              children: [
                Slide(
                  size: size,
                  text: "slide 1",
                  onNext: nextPage,
                  curveSize: 25.00,
                ),
                Slide(
                  size: size,
                  text: "slide 2",
                  onNext: nextPage,
                  curveSize: 50.00,
                ),
                Slide(
                  size: size,
                  text: "slide 3",
                  onNext: nextPage,
                  curveSize: 75.00,
                ),
                 Slide(
                  size: size,
                  text: "slide 4",
                  onNext: nextPage,
                  curveSize: 100.00,
                ),
              ],
            )));
  }
}

class Slide extends StatelessWidget {
  final String text;
  final Size size;
  final VoidCallback onNext;
  final double curveSize;
  const Slide({
    Key? key,
    required this.text,
    required this.onNext, required this.curveSize, required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: size.height,
      width: size.width,
        child: Stack(
      children: [
        Positioned(
          bottom: 50,
          right: 25,
          child: ProgressButton(
            onNext: onNext,
            curveSize: curveSize,
          ),
        )
      ],
    ));
  }
}

class ProgressButton extends StatelessWidget {
  final double curveSize;
  final VoidCallback onNext;
  const ProgressButton({Key? key, required this.onNext, required this.curveSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 75,
        width: 75,
        child: Stack(
          children: [
            AnimatedIndicator(
              duration: const Duration(seconds: 2),
              callback: onNext,
            size:75,
            curveSize: curveSize,
          ),
            Center(
              child: GestureDetector(
                  child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [kBrandColor1, kBrandColor2])),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/icons/light/Arrow - Right 2.svg",
                          color: Colors.white,
                        ),
                      ))),
            )
          ],
        ));
  }
}
