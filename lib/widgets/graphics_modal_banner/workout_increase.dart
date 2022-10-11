import 'package:fitness_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WorkoutIncrease extends StatelessWidget {
  final Size size;
  final DateTime? dateTime;
  final String? percent;
  final String? title;
  const WorkoutIncrease({Key? key, required this.size, this.dateTime, this.percent, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height*0.1,
      width: size.width*05,
      decoration: BoxDecoration(
       color: Colors.red,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Row(
              children: [
                Text("Fri, 28 May",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w400,fontSize: 8,height: 12,color: kGrayColor2),)
              ],
            ),
          )
        ],
      ),
    );
  }
}