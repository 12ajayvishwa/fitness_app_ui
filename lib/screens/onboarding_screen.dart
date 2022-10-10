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
        duration: const Duration(milliseconds: 20), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
          child: PageView(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Slide(
                text: "slide 1",
                onNext: nextPage,
              ),
              Slide(
                text: "slide 2",
                onNext: nextPage,
              ),
              Slide(
                text: "slide 3",
                onNext: nextPage,
              ),
            ],
          ),
        )));
  }
}

class Slide extends StatelessWidget {
  final String text;
  final VoidCallback onNext;
  const Slide({
    Key? key,
    required this.text,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          
          Text(text),
          InkWell(onTap: onNext, child: Container()),
          ProgressButton(
            onNext: onNext,
          )
        ],
      )),
    );
  }
}

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  const ProgressButton({Key? key, required this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 75,
        width: 75,
        child: Stack(
          children: [
            AnimatedIndicator(
            duration:const Duration(seconds: 10),
            size:75,
            callback:onNext
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
