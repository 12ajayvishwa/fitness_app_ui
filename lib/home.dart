import 'package:fitness_ui/utils/buttons/secondary_button.dart';
import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:fitness_ui/widgets/banner_components/home_banner.dart';
import 'package:fitness_ui/widgets/banner_components/photos_reminder_banner.dart';
import 'package:fitness_ui/widgets/banner_components/progress_photo_banner.dart';
import 'package:fitness_ui/widgets/banner_components/sleep_schedule_banner.dart';
import 'package:fitness_ui/widgets/card_components/latest_workout_card.dart';
import 'package:fitness_ui/widgets/card_components/upcoming_workout_card.dart';
import 'package:fitness_ui/widgets/custom_nav_bar.dart';
import 'package:fitness_ui/widgets/custom_text_input_field.dart';
import 'package:fitness_ui/widgets/graphics_modal_banner/results.dart';
import 'package:fitness_ui/widgets/graphics_modal_banner/sleeps.dart';
import 'package:fitness_ui/widgets/lable_button.dart';
import 'package:fitness_ui/widgets/search_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'utils/buttons/add_camera_button.dart';
import 'utils/buttons/auth_button.dart';
import 'utils/buttons/onboarding_button.dart';
import 'widgets/banner_components/sleep_banner.dart';
import 'widgets/banner_components/today_target_banner.dart';
import 'widgets/daily_action.dart';
import 'widgets/graphics_modal_banner/meals.dart';
import 'widgets/graphics_modal_banner/workout_increase.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  bool status = false;

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
      backgroundColor: Color.fromARGB(255, 230, 228, 228),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(children: [
                SearchNav(
                  onTap: () {},
                  size: size,
                  text1: "Workout Tracker",
                  text2: "Meal Planner",
                  text3: "Sleep Tracker",
                ),
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            WorkoutIncrease(size: size),
            const SizedBox(
              height: 10,
            ),
            Meals(
              size: size,
              title: "fibre",
              percent: 91,
              path: "assets/icons/light/Arrow - Up.svg",
              color: kSuccessColor,
              progressPercent: 0.8,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Meals(
              size: size,
              title: "fats",
              percent: 45,
              path: "assets/icons/light/Arrow - Down.svg",
              color: kFaildColor,
              progressPercent: 0.3,
            ),
            const SizedBox(
              height: 10,
            ),
            Results(
                title: "decrease",
                percent: 32,
                color: kFaildColor,
                path: "assets/icons/light/Arrow - Down.svg"),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Results(
                title: "increase",
                percent: 32,
                color: kSuccessColor,
                path: "assets/icons/light/Arrow - Up.svg"),
            const SizedBox(
              height: 10,
            ),
            DailyAction(size: size,title: "Compare my Photo",buttonText: "Compare",onTab: (){},),
            const SizedBox(
              height: 10,
            ),
            Sleeps(title: "decrease", percent: 21, color: kFaildColor),
            UpcomingWorkoutCard(
              size: size,
              status: status,
              image: "assets/images/Workout_Vector1.svg",
              onChanged: (value) {
                setState(() {
                  status = value;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            LatestWorkoutCard(
              size: size,
              image: "assets/images/Workout_Vector.svg",
            ),
            const SizedBox(
              height: 10,
            ),
            SleepScheduleBanner(size: size),
            const SizedBox(
              height: 10,
            ),
            PhotoRemiderBanner(
              size: size,
              date: "July 20",
            ),
            const SizedBox(
              height: 10,
            ),
            TodayTargetBanner(size: size),
            const SizedBox(
              height: 10,
            ),
            HomeBanner(size: size),
            const SizedBox(
              height: 10,
            ),
            SleepBanner(size: size),
            const SizedBox(
              height: 10,
            ),
            ProgressPhotoBanner(size: size),
            const SizedBox(
              height: 10,
            ),
            const LableButton(
              text: "KG",
            ),
            const SizedBox(
              height: 10,
            ),
            AuthButton(
              size: size,
              text: "Next",
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            SecondaryButton(size: size, text: "Button", onTap: () {},color1: kSecondryColor1,color2: kSecondryColor2,),
            const SizedBox(
              height: 10,
            ),
            AddCameraButton(
                size: size, svgPicture: "assets/icons/light/Plus.svg"),
            OnBoardingButton(
              onNext: () {},
            )
          ],
        ),
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
              Rect rect = const Rect.fromLTRB(0, 0, 30, 30);
              return const LinearGradient(
                      colors: [kSecondryColor1, kSecondryColor2],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft)
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
        ),
      ],
    );
  }
}
