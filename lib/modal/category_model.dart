import 'dart:ui';

class CategoryModel {
  final String title;
  final String image;
  final Color? color;

  CategoryModel(
      {required this.title, required this.image, required this.color});

  static List<CategoryModel> categoryList = [
    CategoryModel(
        title: "Salad",
        image: "assets/images/Layer1.png", 
        color: Color(0xff9DCEFF).withOpacity(0.2)),
     CategoryModel(
        title: "cake", 
        image: "assets/images/Layer2.png", 
        color: Color(0xffEEA4CE).withOpacity(0.2)),
     CategoryModel(
        title: "pie", image: "assets/images/Layer3.png", color: Color(0xff9DCEFF).withOpacity(0.2)),
     CategoryModel(
        title: "Smoothies", image: "assets/images/Layer4.png", color: Color(0xffEEA4CE).withOpacity(0.2)),

       CategoryModel(
        title: "Smoothies", image: "assets/images/Layer4.png", color: Color(0xffEEA4CE).withOpacity(0.2))
  ];
}
