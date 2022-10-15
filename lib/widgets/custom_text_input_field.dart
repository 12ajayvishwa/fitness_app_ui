import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/input_field_decoration.dart';

class CustomTextFormField extends StatelessWidget {
  final Size? size;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final String? hintText;
  final TextInputType? textInputType;
  final IconButton? iconButton;
  final bool? obsecureText;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final int? maxLength;

  const CustomTextFormField(
      {Key? key,
      this.size,
      this.controller,
      this.validator,
      this.hintText,
      this.textInputType,
      this.iconButton,
      this.obsecureText,
      this.textInputAction,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.06,
          width: size.width * 0.98,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: kBorderColor,
          ),
        ),
        TextFormField(
          cursorHeight: 22,
          cursorColor: kGrayColor2,
          style: kMediumTextRegular(kGrayColor1),
          controller: controller,
          validator: validator,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          
          maxLength: maxLength,
          decoration: inputDecoration(kBorderColor,"Last Name",prefixIcon: SvgPicture.asset("assets/icons/light/Profile.svg",color: kGrayColor1,)),
          
        )
      ],
    );
  }
}
