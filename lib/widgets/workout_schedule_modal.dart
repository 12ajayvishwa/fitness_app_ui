import 'package:fitness_ui/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/buttons/auth_button.dart';

class WorkoutScheduleModal extends StatelessWidget {
  final Size size;
  final Color color;
  final String? time;
  final String? remainingTime;
  const WorkoutScheduleModal({Key? key, required this.color, this.time, this.remainingTime, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height*0.35,
      width: size.width*0.95,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 34,
            left: 30,
            child: SvgPicture.asset("assets/images/x-icon.svg",height: 18,width: 18,)),
          const Positioned(
            top: 28,
            child: Text("Workout Schedule",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w600,fontSize: 18,color: Color(0xFF1D1617)),)),
          Positioned(
            top: 34,
            right: 30,
            child: SvgPicture.asset("assets/images/more-vertical 2.svg")),
          Positioned(
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const Text("Lowerbody Workout",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 16,color: Color(0xFF1D1617)),),
              const SizedBox(height: 12,),
              Row(
                children:  [
                  SvgPicture.asset("assets/icons/light/Time Circle.svg",color: color,height: 20,width: 20,),
                  const SizedBox(width: 8,),
                  Text("Today | 03:00PM   ", style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w400,fontSize: 12,color: color)),
                  Text(remainingTime??"", style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 12,color: color)),

                ],
              )
            ],),
           
          ),
           Positioned(
            bottom: 30,
            child: AuthButton(text: "Mark as Done",onTap: (){},size: size,),)
        ],
      ),
    );
  }
}