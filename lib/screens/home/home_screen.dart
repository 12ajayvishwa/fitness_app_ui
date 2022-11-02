import 'package:fitness_ui/utils/buttons/custom_dropdown_button.dart';
import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:fitness_ui/widgets/banner_components/home_banner.dart';
import 'package:fitness_ui/widgets/daily_action.dart';
import 'package:fitness_ui/widgets/status/calories.dart';
import 'package:fitness_ui/widgets/status/sleep.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../routes/custom_route.dart';
import '../../widgets/activity_status/workout.dart';
import '../../widgets/card_components/upcoming_workout_card.dart';
import '../../widgets/status/heart_rate.dart';
import '../../widgets/status/water_intake.dart';
import 'components/workout_section.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool switchbutton = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
            height: size.height * 2.7,
            width: size.width,
            child: Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      top: 45, left: 20, right: 20, child: customAppBar(size)),
                  Positioned(
                      top: 130,
                      left: 20,
                      right: 20,
                      child: Column(
                        children: [
                          HomeBanner(
                              size: size,
                              title: "BMI (Body Mass Index)",
                              subTitle: "You have a normal weight",
                              onTap: () {
                               
                              }),
                          const SizedBox(
                            height: 30,
                          ), 
                          DailyAction(
                              title: "Today Target",
                              onTab: () {
                                // ignore: avoid_print
                                print("hhh");
                                 Navigator.pushNamed(
                                    context, activityTrackerScreenRoute);
                              },
                              size: size,
                              buttonText: "Check"),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Activity Status",
                                style:
                                    kLargeTextSemiBold(const Color(0xFF1D1617)),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const HeartRate(),
                              const SizedBox(
                                height: 15,
                              ),
                              activityStatus(size),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Workout Progress",
                                    style: kLargeTextSemiBold(
                                        const Color(0xFF1D1617)),
                                  ),
                                  CustomDropdownButton(size: size)
                                ],
                              ),
                              const WorkOutChart(),
                              const SizedBox(
                                height: 15,
                              ),
                              WorkoutSections(
                                size: size,
                                rowText: "Latest Workout",
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Upcoming Workout",
                                    style: kLargeTextSemiBold(
                                        const Color(0xFF1D1617)),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, workoutTrackerScreenRoute);
                                      },
                                      child: const Text(
                                        "See more",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: kGrayColor2),
                                      ))
                                ],
                              ),
                              UpcomingWorkoutCard(
                                size: size,
                                title: "Fullbody Workout",
                                dateTime: DateTime.now(),
                                image: "assets/images/Workout-Pic.svg",
                                textColor: Colors.black,
                                gradientColor1:
                                    kSecondryColor1.withOpacity(0.8),
                                gradientColor2:
                                    kSecondryColor2.withOpacity(0.8),
                                status: true,
                                onChanged: (v) {
                                  setState(() {
                                    switchbutton = v;
                                  });
                                },
                              ),
                              UpcomingWorkoutCard(
                                size: size,
                                title: "Lowerbody Workout",
                                dateTime: DateTime.now(),
                                image: "assets/images/Workout-Pic1.svg",
                                textColor: kGrayColor1,
                                gradientColor1: kBrandColor1.withOpacity(0.8),
                                gradientColor2: kBrandColor2.withOpacity(0.8),
                                status: false,
                                onChanged: (v) {
                                  setState(() {
                                    switchbutton = v;
                                  });
                                },
                              ),
                              UpcomingWorkoutCard(
                                size: size,
                                title: "Ab Workout",
                                dateTime: DateTime.now(),
                                image: "assets/images/Workout-Pic2.svg",
                                textColor: kGrayColor1,
                                gradientColor1: kBrandColor1.withOpacity(0.8),
                                gradientColor2: kBrandColor2.withOpacity(0.8),
                                status: false,
                                onChanged: (v) {
                                  setState(() {
                                    switchbutton = v;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      )),
                ],
              ),
            )),
      ),
    );
  }

  activityStatus(Size size) {
    return SizedBox(
      height: size.height * 0.48,
      width: size.width,
      child: Stack(alignment: Alignment.center, children: [
        const Positioned(left: 0, child: WaterIntake()),
        Positioned(
            right: 0,
            top: 13,
            child: Sleep(
              size: size,
            )),
        Positioned(bottom: 13, right: 0, child: Calories(size: size))
      ]),
    );
  }

  customAppBar(Size size) {
    return SizedBox(
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
          InkWell(
            onTap: () => Navigator.pushNamed(context, notificationsScreenRoute),
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
