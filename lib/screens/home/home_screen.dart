import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:fitness_ui/widgets/banner_components/home_banner.dart';
import 'package:fitness_ui/widgets/daily_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 45, left: 20, right: 20, child: customAppBar(size)),
                Positioned(
                    top: 130,
                    left: 20,
                    right: 20,
                    child: HomeBanner(
                        size: size,
                        title: "BMI (Body Mass Index)",
                        subTitle: "You have a normal weight",
                        onTap: () {})),
                Positioned(
                  top: 320,
                  left: 20,
                  right: 20,
                  child: DailyAction(title: "Today Target", onTab: (){}, size: size, buttonText: "Check"))
              ],
            )),
      ),
    );
  }

  customAppBar(Size size) {
    return Container(
      height: size.height * 0.07,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Welcome Back,",
                style: kSmallTextRegular(kGrayColor2),
              ),
              Text(
                "Stefani Wong",
                style: kTitleH4Bold(const Color(0xFF1D1617)),
              )
            ],
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFF7F8F8),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xFF1D1617).withOpacity(0.07),
                      offset: const Offset(0, 4),
                      blurRadius: 2,
                      spreadRadius: 2)
                ]),
            child: Stack(alignment: Alignment.center, children: [
              SvgPicture.asset("assets/icons/bold/Bell-Icon.svg"),
              Positioned(
                top: 12,
                right: 14,
                child: Container(
                  height: 4,
                  width: 4,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: kFaildColor),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
