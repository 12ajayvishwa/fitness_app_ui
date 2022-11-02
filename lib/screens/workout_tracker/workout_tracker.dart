import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/widgets/daily_action.dart';
import 'package:flutter/material.dart';
import '../../utils/text_style.dart';
import '../../widgets/activity_status/workout_2.dart';
import '../../widgets/card_components/upcoming_workout_card.dart';
import '../notifications_screen/notification_screen.dart';

class WorkoutTracker extends StatefulWidget {
  const WorkoutTracker({Key? key}) : super(key: key);

  @override
  State<WorkoutTracker> createState() => _WorkoutTrackerState();
}

class _WorkoutTrackerState extends State<WorkoutTracker> {
  bool switchbutton = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
            height: size.height * 1.42,
            width: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 0,
                    child: Container(
                      height: size.height / 2,
                      width: size.width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [kBrandColor1, kBrandColor2])),
                      child: const WorkOutChart2(),
                    )),
                Positioned(
                  top: 40,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallContainer(
                        icon: "assets/icons/light/Arrow - Left 2.svg",
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        "Activity Tracker",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      SmallContainer(
                        icon: "assets/icons/light/dot 2.svg",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      height: size.height,
                      width: size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: Stack(alignment: Alignment.center, children: [
                        Positioned(
                          top: 10,
                          child: Container(
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xFF1D1617).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                        Positioned(
                            top: 50,
                            left: 20,
                            right: 20,
                            child: DailyAction(
                                title: "Daily Workout Schedule",
                                onTab: () {},
                                size: size,
                                buttonText: "Check"))
                      ]),
                    )),
                Positioned(
                  top: 470,
                  left: 20,
                  right: 20,
                  child: SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Upcoming Workout",
                          style: kLargeTextSemiBold(const Color(0xFF1D1617)),
                        ),
                        TextButton(
                            onPressed: () {},
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
                  ),
                ),
                Positioned(
                    top: size.height * 0.65,
                    left: 20,
                    right: 20,
                    child: Column(
                      children: [
                        UpcomingWorkoutCard(
                          size: size,
                          title: "Fullbody Workout",
                          dateTime: DateTime.now(),
                          image: "assets/images/Workout-Pic.svg",
                          textColor: Colors.black,
                          gradientColor1: kSecondryColor1.withOpacity(0.8),
                          gradientColor2: kSecondryColor2.withOpacity(0.8),
                          status: true,
                          onChanged: (v) {
                            setState(() {
                              switchbutton = v;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
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
                      ],
                    )),
                Positioned(
                    top: size.height * 0.95,
                    left: 20,
                    right: 20,
                    child:const  Text(
                      "What Do You Want to Train",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black),
                    ))
              ],
            )),
      ),
    );
  }
}
