

import 'package:fitness_ui/utils/text_style.dart';
import 'package:flutter/material.dart';

class SearchNav extends StatelessWidget {
  final Size size;
  final String text1;
  final String text2;
  final String text3;
  final VoidCallback onTap;
  const SearchNav({Key? key, required this.text1, required this.onTap, required this.size, required this.text2, required this.text3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height*0.15,
      width: size.width*0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFFFFFFF),
        boxShadow: [BoxShadow(
          offset: const Offset(8,10),
          blurRadius: 0.2,
          spreadRadius: 0.2,
          color: const Color(0xFF1D1617).withOpacity(0.04)
        )]  
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          activityField(text1),
          activityField(text2),
          activityField(text3)
        
        ]),
      ),
    );

  }

  Row activityField(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFDDDADA)
              ),
            ),
            const SizedBox(width: 5,),
            SizedBox(
              width: size.width/2,
             
              child: Text(text,style: kTextSubRegular,))
            // Checkbox(
            //   checkColor: Colors.white,
            //   value: isChecked, 
            //   fillColor: MaterialStateProperty.resolveWith(getColor),
            //   onChanged: (bool? value){
            //     setState(() {
            //       isChecked = value!;
            //     });
            //   })
          ],
        );
  }
  Color getColor(Set<MaterialState> state){
    const Set<MaterialState> interactiveState = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if(state.any(interactiveState.contains)){
      return Colors.blue;
    }
    return const Color(0xFFDDDADA);
  }
}