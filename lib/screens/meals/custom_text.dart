import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String title;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  CustomText({Key? key,required this.title,
  required this.fontSize,
  required this.color,
  required this.fontWeight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(
                fontFamily: "Poppins",
                color:color,
                fontSize: fontSize,
                fontWeight:fontWeight,
              ),);
    
  }
}