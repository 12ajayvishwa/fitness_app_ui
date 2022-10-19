import 'package:fitness_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/search_filed_decoration.dart';

class SearchBar extends StatelessWidget {
final Size size;
  const SearchBar({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height*0.06,
      width: size.width*0.96,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(
          offset: const Offset(0,4),
          blurRadius: 0.2,
          spreadRadius: 0.6,
          color: const Color(0xFF1D1617).withOpacity(0.04)
        )]  
      ),
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 320,
            child: TextFormField(
              cursorColor: kGrayColor1,
              decoration: inputSearchDecoration(),
            ),
          ),
          const SizedBox(width: 2,),
         Container(
          height: 30,
          width: 1,
          color: Colors.grey,
         ),
          const SizedBox(width: 12,),
        ShaderMask(
            child: SizedBox(
              width: 25,
              height: 25,
              child: SvgPicture.asset(
                "assets/icons/light/Filter.svg",
                height: 25,
                width: 25,
                color: Colors.white,
              ),
            ),
            shaderCallback: (Rect bounds) {
              Rect rect = const Rect.fromLTRB(0, 0, 30, 30);
              return const LinearGradient(
                      colors: [kBrandColor1, kBrandColor2],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft)
                  .createShader(rect);
            }),
        ],
      ),
    );
  }
}