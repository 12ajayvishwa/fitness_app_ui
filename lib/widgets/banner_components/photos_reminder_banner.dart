import 'package:fitness_ui/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhotoRemiderBanner extends StatelessWidget {
  final Size size;
  final String? date;
  final VoidCallback? close;
  const PhotoRemiderBanner({Key? key, this.date, required this.size, this.close}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       height: size.height*0.12,
      width: size.width*0.95,
      decoration: BoxDecoration(
        color: const Color(0xFFFF0000).withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(children: [
        Positioned(
          top: 15,
          right: 15,
          child: SvgPicture.asset("assets/images/x-icon.svg",height: 16,width: 16,)),
        Positioned(
          left: 15,
          bottom: 15,
          child: Row(
            
            children: [
              SvgPicture.asset("assets/images/Group 10191.svg"),
              const SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Reminder!",style: kSmallTextRegular(const Color(0xFFFF0000)),),
                  Text("Next Photos Fall On${date!}",style: kSmallTextRegular(Colors.black),)
                ],
              )
            ],
          )) 
      ]),
    );
  }
}