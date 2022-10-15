import 'package:flutter/material.dart';
import 'colors.dart';

final Shader linearGradient1 = LinearGradient(
  colors: <Color>[kSecondryColor1, kSecondryColor2],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


final Shader linearGradient2 = LinearGradient(
  colors: <Color>[kBrandColor1, kBrandColor2],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));