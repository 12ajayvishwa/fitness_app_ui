import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Results extends StatelessWidget {
  final Size? size;
  final String title;
  final double percent;
  final Color color;
  final String path;
  const Results({Key? key, this.size, required this.title, required this.percent, required this.color, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    const SizedBox(width: 4,),
            SvgPicture.asset(path, height: 10,
                          width: 10,
                          color: color,)
          ],
        ),
      ),);
  }
}