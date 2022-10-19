import 'package:fitness_ui/routes/custom_route.dart';
import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/text_style.dart';
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
        duration: const Duration(seconds:3), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          controller: pageController,
          children: [
        Slide(
          size: size,
          title: "Track Your Goal",
          subTitle: "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
          onNext: nextPage,
          
          curveSize: 25.00,
          path: "assets/images/First_Slide.png",
        ),
        Slide(
          size: size,
          title: "Get Burn",
          subTitle: "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
          onNext: nextPage,
          curveSize: 50.00,
          path:"assets/images/Second_Slide.png"
        ),
        Slide(
          size: size,
          title: "Eat Well",
          subTitle: "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
          onNext: nextPage,
          curveSize: 75.00,
          path: "assets/images/Third_Slide.png",
        ),
        Slide(
          size: size,
         title: "Improve Sleep\nQuality",
         subTitle: "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning",
         onNext: (){},
          goNext: () {
            Navigator.pushNamed(context, signupScreenRoute);
          },
          curveSize: 100.00,
          path: "assets/images/Fourth_Slide.png",
        ),
          ],
        ));
  }
}

class Slide extends StatelessWidget {
  final String title;
  final String subTitle;
  final Size size;
  final VoidCallback onNext;
  final VoidCallback? goNext;
  final double curveSize;
  final String path;
  const Slide({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.onNext,
    this.goNext,
    required this.curveSize,
    required this.size, required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Positioned(
              bottom: 50,
              right: 25,
              child: ProgressButton(
                goNext: goNext,
                onNext: onNext,
                curveSize: curveSize,
              ),
            ),
            Positioned(
                top: 0,
                child: Image.asset(path)),
            Positioned(
              bottom: size.height * 0.2,
              left: 20,
              child: SizedBox(
                height: size.height*0.23,
                width: size.width*0.95,
                
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: kTitleH2Bold,),
                  const SizedBox(height: 20,),
                  Text(subTitle,textAlign: TextAlign.start,style: kMediumTextRegular(kGrayColor1),)
                ],
              ),
              ))
          ],
        ));
  }
}

class ProgressButton extends StatelessWidget {
  final double curveSize;
  final VoidCallback onNext;
  final VoidCallback? goNext;
  const ProgressButton(
      {Key? key, required this.onNext, required this.curveSize,this.goNext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 75,
        width: 75,
        child: Stack(
          children: [
            AnimatedIndicator(
              duration: const Duration(seconds: 3),
              callback: onNext,
              size: 75,
              curveSize: curveSize,
            ),
            Center(
              child: GestureDetector(
                onTap: goNext,
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
