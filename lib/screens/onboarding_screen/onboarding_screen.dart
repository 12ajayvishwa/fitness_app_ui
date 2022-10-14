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
        body: PageView(
          // controller: pageController,
          children: [
        Slide(
          size: size,
          text: "slide 1",
          onNext: nextPage,
          curveSize: 25.00,
          path: "assets/images/First_Slide.png",
        ),
        Slide(
          size: size,
          text: "slide 2",
          onNext: nextPage,
          curveSize: 50.00,
          path:"assets/images/Second_Slide.png"
        ),
        Slide(
          size: size,
          text: "slide 3",
          onNext: nextPage,
          curveSize: 75.00,
          path: "assets/images/Third_Slide.png",
        ),
        Slide(
          size: size,
          text: "slide 4",
          onNext: nextPage,
          curveSize: 100.00,
          path: "assets/images/Fourth_Slide.png",
        ),
          ],
        ));
  }
}

class Slide extends StatelessWidget {
  final String text;
  final Size size;
  final VoidCallback onNext;
  final double curveSize;
  final String path;
  const Slide({
    Key? key,
    required this.text,
    required this.onNext,
    required this.curveSize,
    required this.size, required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            ),
            Positioned(
                top: 0,
                child: Image.asset(path)),
            Positioned(
              bottom: size.height*0.3,
              child: Container(
                height: size.height*0.15,
                width: size.width*0.95,
              child: Column(
                
              ),
              ))
          ],
        ));
  }
}

class ProgressButton extends StatelessWidget {
  final double curveSize;
  final VoidCallback onNext;
  const ProgressButton(
      {Key? key, required this.onNext, required this.curveSize})
      : super(key: key);

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
              size: 75,
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
