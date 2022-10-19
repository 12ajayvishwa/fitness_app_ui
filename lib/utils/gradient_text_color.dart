import 'package:flutter/material.dart';
import 'colors.dart';

final Shader linearGradient1 = const LinearGradient(
  colors: <Color>[kSecondryColor1, kSecondryColor2],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


final Shader linearGradient2 = const LinearGradient(
  colors: <Color>[kBrandColor1, kBrandColor2],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));