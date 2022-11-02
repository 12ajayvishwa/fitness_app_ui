import 'package:fitness_ui/modal/today_meal_model.dart';
import 'package:fitness_ui/utils/buttons/secondary_button.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:fitness_ui/widgets/activity_status/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/buttons/custom_dropdown_button.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_appBAr.dart';
import '../notifications_screen/notification_screen.dart';

class MealPlanner extends StatefulWidget {
  const MealPlanner({Key? key}) : super(key: key);

  @override
  State<MealPlanner> createState() => _MealPlannerState();
}

class _MealPlannerState extends State<MealPlanner> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height * 1.42,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: 20,
                right: 20,
                child: CustomAppBar(title: "Meal Planner",),
              ),
              Positioned(
                  top: 105,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Meal Nutritions",
                        style: kLargeTextMedium,
                      ),
                      CustomDropdownButton(
                        size: size,
                        text: "weekly",
                      )
                    ],
                  )),
              const Positioned(top: 160, left: 20, right: 20, child: Meal()),
              Positioned(
                  top: size.height * 0.52,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Color(0xff9DCEFF).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Daily Meal Schedule", style: kMediumTextMedium),
                        SecondaryButton(
                            size: size,
                            text: "Check",
                            onTap: () {},
                            color1: Color(0xff9DCEFF),
                            color2: const Color(0xff92A3FD))
                      ],
                    ),
                    height: size.height * 0.1,
                    width: size.width,
                  )),
              Positioned(
                  top: size.height * 0.68,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today Meals",
                        style: kLargeTextMedium,
                      ),
                      CustomDropdownButton(size: size)
                    ],
                  )),
              Positioned(top: size.height * 0.77, child: todayMeal(size)),
              Positioned(
                  left: 0,
                  right: 0,
                  top: size.height * 1.04,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: Text(
                          
                          "Find Something to Eat",
                          
                          style: kLargeTextSemiBold(Colors.black),
                        ),
                      ),
                     const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: size.height * 0.22,
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: 20),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 15,),
                                child: SizedBox(
                                  height: size.height * 0.22,
                                  width: size.width * 0.5,
                                  child: Stack(children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xff9DCEFF)
                                              .withOpacity(0.2),
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              topRight: Radius.circular(100))),
                                    ),
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Image.asset(
                                            "assets/images/breakfast.png")),
                                    Positioned(
                                        bottom: 20,
                                        left: 20,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Breakfast",
                                              style: kSmallTextMedium(
                                                  Colors.black),
                                            ),
                                            Text(
                                              "120+ Foods",
                                              style: kText12W400(Colors.grey),
                                            ),
                                            SizedBox(height: 5,),
                                            SecondaryButton(
                                                size: size,
                                                text: "Select",
                                                onTap: () {},
                                                color1: Color(0xff9DCEFF),
                                                color2: Color(0xff92A3FD))
                                          ],
                                        ))
                                  ]),
                                ),
                              );
                            }),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Container todayMeal(Size size) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: size.height * 0.28,
      width: size.width,
      child: ListView.builder(
          padding: EdgeInsets.all(0),
          itemCount: TodayMealModel.todayMealList.length,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 2,
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 0.2)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                height: size.height * 0.120,
                width: size.width,
                child: Row(
                  children: [
                    Image.asset(TodayMealModel.todayMealList[index].image),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(TodayMealModel.todayMealList[index].title,
                            style: kSmallTextSubMedium(Colors.black)),
                        Row(
                          children: [
                            Text(TodayMealModel.todayMealList[index].day,
                                style: kText12W400(Color(0xff7B6F72))),
                            Text(
                              " | ",
                              style: TextStyle(color: Color(0xff7B6F72)),
                            ),
                            Text(TodayMealModel.todayMealList[index].time,
                                style: kText12W400(Color(0xff7B6F72))),
                          ],
                        )
                      ],
                    )),
                    Container(
                      height: size.height * 0.04,
                      width: size.width * 0.08,
                      decoration: BoxDecoration(
                        color: Color(0xffEEA4CE).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: ShaderMask(
                            child: SvgPicture.asset(
                              "assets/icons/light/Notification.svg",
                              color: Colors.white,
                            ),
                            shaderCallback: (Rect bounds) {
                              Rect rect = const Rect.fromLTRB(0, 0, 30, 30);
                              return const LinearGradient(
                                      colors: [
                                    kSecondryColor1,
                                    kSecondryColor2
                                  ],
                                      begin: Alignment.bottomRight,
                                      end: Alignment.topLeft)
                                  .createShader(rect);
                            }),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
