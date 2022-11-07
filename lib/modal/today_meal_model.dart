import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodayMealModel {
  String title;
  String image;
  IconData icon;
  String day;
  String time;

  TodayMealModel(
      {required this.title,
      required this.image,
      required this.day,
      required this.icon,
      required this.time});
  static List<TodayMealModel> todayMealList = [
    TodayMealModel(
        title: "Salmon Nigiri",
        image: "assets/images/nigiri 1.png",
        day: "Today",
        icon: Icons.notifications,
        time: "7am"),
      TodayMealModel(
        title: "Salmon Nigiri",
        image: "assets/images/nigiri 1.png",
        day: "Today",
        icon: Icons.notifications,
        time: "7am")
  ];
}
