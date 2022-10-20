import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_style.dart';
import '../../../widgets/card_components/latest_workout_card.dart';

class WorkoutSections extends StatelessWidget {
  const WorkoutSections({
    Key? key,
    required this.size, required this.rowText,
  }) : super(key: key);

  final Size size;
  final String rowText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
    mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
    children: [
      Text(
        rowText,
        style: kLargeTextSemiBold(
            const Color(0xFF1D1617)),
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
    LatestWorkoutCard(
    size: size,
    image: "assets/images/Workout-Pic.svg",
    title: "Fullbody Workout",
    onTab: (){},
    caloriesBurn: 180,
    percent: 0.5,
    time: " 20minutes",
    textColor: kGrayColor1,
    gradientColor1: kBrandColor1.withOpacity(0.8),
    gradientColor2: kBrandColor2.withOpacity(0.8),
    ),
    const SizedBox(height: 15,),
    LatestWorkoutCard(
    size: size,
    image: "assets/images/Workout-Pic1.svg",
    title: "Lowerbody Workout",
    onTab: (){},
    caloriesBurn: 200,
    percent: 0.8,
    time: " 30minutes",
    textColor: Colors.black,
    gradientColor1: kSecondryColor2.withOpacity(0.8),
    gradientColor2: kSecondryColor1.withOpacity(0.8),
    ),
    const SizedBox(height: 15,),
    LatestWorkoutCard(
    size: size,
    image: "assets/images/Workout-Pic2.svg",
    title: "Ab Workout",
    onTab: (){},
    caloriesBurn: 120,
    percent: 0.6,
    time: " 20minutes",
    textColor: kGrayColor1,
    gradientColor1: kBrandColor1.withOpacity(0.8),
    gradientColor2: kBrandColor2.withOpacity(0.8),
    ),
      ],
    );
  }
}
