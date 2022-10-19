import 'package:fitness_ui/utils/buttons/custom_dropdown_button.dart';
import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/widgets/activity_status/activity_chart.dart';
import 'package:fitness_ui/widgets/activity_status/workout_2.dart';
import 'package:fitness_ui/widgets/custom_nav_bar.dart';
import 'package:fitness_ui/widgets/search_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'widgets/activity_status/meal.dart';
import 'widgets/activity_status/result.dart';
import 'widgets/activity_status/sleep_chart.dart';
import 'widgets/activity_status/workout.dart';
import 'widgets/activity_time_line.dart';
import 'widgets/status/calories.dart';
import 'widgets/status/sleep.dart';
import 'widgets/status/water_intake.dart';
import 'widgets/tab_bar.dart';
import 'widgets/workout_train_section.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  bool status = false;
  String dropdownvalue = 'Breakfast';

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
      backgroundColor: const Color.fromARGB(255, 230, 228, 228),
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
            const WaterIntake(),
            const SizedBox(
              height: 10,
            ),
            const Sleep(),
            const SizedBox(
              height: 10,
            ),
            Calories(size: size),
            const SizedBox(
              height: 10,
            ),
            ActivityChart(size: size),
            const SizedBox(
              height: 10,
            ),
            const WorkOutChart(),
            // ActivityChart(size: size),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const WorkOutChart2(),
            // ActivityChart(size: size),
            const SizedBox(
              height: 10,
            ),

            const Result(),
            const SizedBox(
              height: 10,
            ),
            const Meal(),
            const SizedBox(
              height: 10,
            ),
            const SleepChart(),
            const SizedBox(
              height: 10,
            ),
            ActivityTimeLine(
              size: size,
              time: "Fri, 28 June ",
            ),
            const SizedBox(
              height: 10,
            ),
            ActivityChart(size: size),
            const SizedBox(
              height: 10,
            ),
            CustomDropdownButton(
              size: size,
              text: "Breakfast",
            ),
            const SizedBox(
              height: 10,
            ),
            SwitchTabBar(
              size: size,
            ),
            const SizedBox(
              height: 10,
            ),
            WorkoutTrainSection(size: size)
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
