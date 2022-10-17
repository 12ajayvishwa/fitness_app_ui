import 'package:fitness_ui/utils/buttons/auth_button.dart';
import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:fitness_ui/widgets/custom_text_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/lable_button.dart';

class RegistrationOne extends StatefulWidget {
  const RegistrationOne({Key? key}) : super(key: key);

  @override
  State<RegistrationOne> createState() => _RegistrationOneState();
}

class _RegistrationOneState extends State<RegistrationOne> {
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  final items = ['Male', 'Female', 'Others'];
  String? value;
  String? value1;
  String? _dropdownError;
  int _selectedIndex = 0;
  bool isDropdownOpened = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: size.height * 0.08,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/images/Vector-Section-bg.png"),
                    SvgPicture.asset("assets/images/Vector-Section.svg")
                  ],
                ),
              ),
              Positioned(
                  top: size.height * 0.43,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Let’s complete your profile",
                        style: kTitleH4Bold(const Color(0xFF1D1617)),
                      ),
                      Text(
                        "It will help us to know more about you!",
                        style: kSmallTextRegular(const Color(0xFF7B6F72)),
                      )
                    ],
                  )),
              Positioned(bottom: size.height * 0.09, child: formSection(size)),
              Positioned(
                  bottom: size.height * 0.05,
                  child: AuthButton(
                    text: "Next",
                    onTap: () {
                      print("ok");
                    },
                    size: size,
                    svgPicture2: "assets/icons/light/Arrow - Right 2.svg",
                  ))
            ],
          ),
        ),
      ),
    );
  }

  formSection(Size size) {
    double height = 15;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        alignment: Alignment.topCenter,
        height: size.height * 0.38,
        width: size.width * 0.90,
        child: Form(
            child: Column(
          children: [
            genderPicker(size),
            // CustomTextFormField(
            //   hintText: "Choose Gender",
            //   prefixIcon: SvgPicture.asset(
            //     "assets/icons/light/2 User.svg",
            //     color: kGrayColor1,
            //   ),
            //   suffixIcon: SvgPicture.asset(
            //     "assets/icons/light/Arrow - Down 2.svg",
            //     color: kGrayColor1,
            //   ),
            // ),
            SizedBox(
              height: height,
            ),
            CustomTextFormField(
              hintText: "Date of Birth",
              prefixIcon: SvgPicture.asset(
                "assets/icons/light/Calendar.svg",
                color: kGrayColor1,
              ),
            ),
            SizedBox(
              height: height,
            ),
            Row(
              children: [
                Container(
                  height: size.height * 0.06,
                  width: size.width * 0.75,
                  child: CustomTextFormField(
                    hintText: "Your Weight",
                    prefixIcon: SvgPicture.asset(
                      "assets/icons/light/weight.svg",
                      color: kGrayColor1,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const LableButton(
                  text: "KG",
                )
              ],
            ),
            SizedBox(
              height: height,
            ),
            Row(
              children: [
                Container(
                  height: size.height * 0.06,
                  width: size.width * 0.75,
                  child: CustomTextFormField(
                    hintText: "Your Height",
                    prefixIcon: SvgPicture.asset(
                      "assets/icons/light/Swap.svg",
                      color: kGrayColor1,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const LableButton(
                  text: "CM",
                )
              ],
            )
          ],
        )),
      ),
    );
  }

  genderPicker(Size size) {
    return Container(
      height: size.height * 0.06,
      width: size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          color: const Color(0xFFF7F8F8)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(13.0, 13.0,0, 13.0),
            child: SvgPicture.asset(
              "assets/icons/light/2 User.svg",
              color: kGrayColor1,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            height: size.height * 0.06,
            width: size.width * 0.78,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: const Color(0xFFF7F8F8)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                iconSize: 25,
                hint: Text(
                  "Gender",
                  style: kLargeTextRegular(kGrayColor1),
                ),
                icon: SvgPicture.asset(
                  "assets/icons/light/Arrow - Down 2.svg",
                  color: kGrayColor1,
                ),
                isExpanded: true,
                items: items.map(buildMenuItems).toList(),
                onChanged: (value) =>
                    setState(() => this.value = value as String?),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItems(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: kMediumTextRegular(kGrayColor1)
        ),
      );
}
