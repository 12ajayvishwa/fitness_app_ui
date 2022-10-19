import 'package:fitness_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

InputDecoration inputSearchDecoration() {
      double radius = 14;
  return InputDecoration(
    contentPadding: const EdgeInsets.fromLTRB(15.0, 13.0, 15.0, 13.0),
    hintText: "Search here",
    hintStyle: const TextStyle(fontFamily: "Poppins",fontSize: 12,fontWeight: FontWeight.w400,color: kGrayColor3),
    prefixIcon: Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15),
      child: SvgPicture.asset("assets/icons/light/Search.svg",color: kGrayColor2,),
    ),
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide.none
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide.none
    ),
    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide.none),
    focusedErrorBorder:
        OutlineInputBorder(borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide.none),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide.none),
  );
}
