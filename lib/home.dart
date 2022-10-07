import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:fitness_ui/widgets/custom_nav_bar.dart';
import 'package:fitness_ui/widgets/custom_text_input_field.dart';
import 'package:fitness_ui/widgets/lable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;

  final pages = [
    const Icon(Icons.abc),
    const Icon(Icons.ac_unit_outlined),
    const Icon(Icons.access_alarm),
    const Icon(Icons.accessibility),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      bottomNavigationBar: CustomBottomNavBar(
        size: size,
        svgIcon1: pageIndex == 0
            ? selectedNavIcon("assets/icons/bold/Home.svg")
            : unselectedNavIcon("assets/icons/light/Home.svg"),
        onPressed1: () {
          setState(() {
            pageIndex = 0;
          });
        },
        svgIcon2: pageIndex == 1
            ? selectedNavIcon("assets/icons/bold/Activity.svg")
            : unselectedNavIcon(
                "assets/icons/light/Activity.svg",
              ),
        onPressed2: () {
          setState(() {
            pageIndex = 1;
          });
        },
        svgIcon3: pageIndex == 2
            ? selectedNavIcon("assets/icons/bold/Camera.svg")
            : unselectedNavIcon("assets/icons/light/Camera.svg"),
        onPressed3: () {
          setState(() {
            pageIndex = 2;
          });
        },
        svgIcon4: pageIndex == 3
            ? selectedNavIcon("assets/icons/bold/Profile.svg")
            : unselectedNavIcon("assets/icons/light/Profile.svg"),
        onPressed4: () {
          setState(() {
            pageIndex = 3;
          });
        },
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 500,
              width: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                      colors: [kSecondryColor1, kSecondryColor2])),
              child: Column(children: [
                Text("Hello everyone!", style: kTitleH2Bold),
                Text("Hello everyone!", style: kTitleH2SemiBold),
                Text("Hello everyone!", style: kTitleH2Medium),
                Text("Hello everyone!", style: kTitleH2Regular),
                const CustomTextFormField(),
              ]),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const LableButton(
            text: "KG",
          ),
        ],
      ),
    );
  }

  unselectedNavIcon(String icon) {
    return SvgPicture.asset(
      icon,
      height: 30,
      width: 30,
      color: kGrayColor2,
    );
  }

  selectedNavIcon(String icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShaderMask(
            child: SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                icon,
                height: 30,
                width: 30,
                color: Colors.white,
              ),
            ),
            shaderCallback: (Rect bounds) {
              final Rect rect = Rect.fromLTRB(0, 0, 30, 30);
              return const LinearGradient(
                      colors: [kSecondryColor1, kSecondryColor2],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft)
                  .createShader(rect);
            }),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 5,
          width: 5,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [kSecondryColor2, kSecondryColor1],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft)),
        )
      ],
    );
  }
}
