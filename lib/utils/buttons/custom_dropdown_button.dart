// ignore_for_file: prefer_const_constructors

import 'package:fitness_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropdownButton extends StatefulWidget {
  final Size size;
  final String? text;
  final VoidCallback? onTab;
  const CustomDropdownButton(
      {Key? key, required this.size, this.text, this.onTab})
      : super(key: key);

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  final List<DropdownMenuItem<String>>? items = [
    const DropdownMenuItem(value: 'Breakfast',child: Text('Breakfast',style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white),),),
    const DropdownMenuItem(value: 'Weekly', child: Text('Weekly',style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white),)),
  ];
  String selectedValue = 'Breakfast';
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.size.height * 0.058,
        width: widget.size.width * 0.32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(colors: const [kBrandColor1, kBrandColor2])),
        child: Center(
          child: DropdownButton(
            value: selectedValue,
           dropdownColor: kBrandColor2,
           borderRadius: BorderRadius.circular(15),
            onChanged: (String? value) {
              setState(() {
                selectedValue = value!;
              });
            },
            items: items,
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/icons/light/Arrow - Down 2.svg",
                height: 15,
                width: 15,
                color: Colors.white,
              ),
            ),
          ),
        )
        // Center(
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       Text(
        //         widget.text!,
        //         style: const TextStyle(
        //             fontFamily: "Poppins",
        //             fontWeight: FontWeight.w400,
        //             fontSize: 12,
        //             color: Colors.white),
        //       ),
        //       GestureDetector(
        //           onTap: () {
        //             print("clicked");
        //           },
        //           child: SvgPicture.asset(
        //             "assets/icons/light/Arrow - Down 2.svg",
        //             height: 15,
        //             width: 15,
        //             color: Colors.white,
        //           ))
        //     ],
        //   ),
        // )
        );
  }
}
