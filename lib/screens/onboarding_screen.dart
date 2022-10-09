import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController(initialPage: 0);
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
              Slide(text:"slide 1", onNext: () {  },),
              Slide(text:"slide 2", onNext: () {  },),
              Slide(text:"slide 3", onNext: () {  },),
            ],
          ),
        )));
  }
}

class Slide extends StatelessWidget {
  final String text;
  final VoidCallback onNext;
  const Slide({
    Key? key, required this.text, required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [Text(text), InkWell(onTap: onNext, child: Container())],
      )),
    );
  }
}
