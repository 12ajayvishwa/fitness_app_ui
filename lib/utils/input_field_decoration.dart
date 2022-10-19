import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:flutter/material.dart';

InputDecoration inputDecoration(
  Color fillColor,
  String hintText,
    {IconButton? iconButton, Widget? prefixIcon, Widget? suffixIcon}) {
      double radius = 14;
  return InputDecoration(
    contentPadding: const EdgeInsets.fromLTRB(15.0, 13.0, 15.0, 13.0),
    hintText: hintText,
    hintStyle: kLargeTextRegular(kGrayColor1),
    prefixIcon: Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15),
      child: prefixIcon,
    ),
    suffixIcon: Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15,right: 15),
      child: suffixIcon,
    ),
    filled: true,
    fillColor: fillColor,
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
