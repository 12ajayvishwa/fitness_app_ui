import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Sleeps extends StatelessWidget {
  final Size? size;
  final String title;
  final double percent;
  final Color color;
  const Sleeps({Key? key, this.size, required this.title, required this.percent, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
        width: 100,
        decoration: BoxDecoration(
         
          borderRadius: BorderRadius.circular(8)
        ),
      child: Stack(
        alignment: Alignment.topCenter,
        children:[
        Positioned(
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("$percent%",style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: color,
                            ),),
                  const SizedBox(width: 4,),
                  Text(title,style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: color,
                            ),),
                
                ],
              ),
            ),),
        ),
        Positioned(
          top: 10,
          child: SvgPicture.asset("assets/images/Arrow.svg",color: Colors.white,))
        ]
      ),
    
    );
  }
}