
import 'package:fitness_ui/routes/custom_route.dart';
import 'package:fitness_ui/utils/buttons/auth_button.dart';
import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/input_field_decoration.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:fitness_ui/widgets/custom_text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
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
  int selectedWeight = 0;
  bool isDropdownOpened = false;

  Future<void> selectDob() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2022, 12),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                    primary: kBrandColor2,
                    onPrimary: Colors.white,
                    onSurface: kGrayColor1),
                dialogTheme: DialogTheme(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14))),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        primary: Colors.red,
                        textStyle: const TextStyle(fontFamily: "Poppins")))),
            child: child!);
      },
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

      setState(() {
        dobController.text = formattedDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
              Positioned(
                  bottom: size.height * 0.09,
                  child: formSection(
                    size,
                    (value) {
                      setState(() {
                        selectedWeight = value;
                      });
                    },
                  )),
              Positioned(
                  bottom: size.height * 0.05,
                  child: AuthButton(
                    text: "Next",
                    onTap: () {
                      Navigator.pushNamed(context, registration2ScreenRoute);
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

  formSection(Size size, void Function(int) onChanged) {
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
              controller: dobController,
              readOnly: true,
              onTap: selectDob,
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: kBorderColor),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 13),
                        child: SvgPicture.asset(
                          "assets/icons/light/weight.svg",
                          color: kGrayColor1,
                        ),
                      ),
                      selectedWeight == 0
                          ? Text(
                              "Your Weight",
                              style: kLargeTextRegular(kGrayColor1),
                            )
                          : Text(
                              "$selectedWeight KG",
                              style: kLargeTextRegular(kBlackColor),
                            )
                    ],
                  ),

                  // CustomTextFormField(
                  //   controller: weightController,
                  //   validator: (value) {
                  //     if(value == null){
                  //       return "please enter your weight";
                  //     }
                  //   },
                  //   hintText: "Your Weight",
                  //   readOnly: true,
                  //   prefixIcon: SvgPicture.asset(
                  //     "assets/icons/light/weight.svg",
                  //     color: kGrayColor1,
                  //   ),
                  // ),
                ),
                const SizedBox(
                  width: 10,
                ),
                LableButton(
                    text: "KG",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return dialogBox(onChanged);
                        },
                      );
                    })
              ],
            ),
            SizedBox(
              height: height,
            ),
            Row(
              children: [
                SizedBox(
                  height: size.height * 0.06,
                  width: size.width * 0.75,
                  child: CustomTextFormField(
                    readOnly: true,
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
                LableButton(
                  text: "CM",
                  onTap: () {},
                )
              ],
            )
          ],
        )),
      ),
    );
  }

  dialogBox(void Function(int) onChanged) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      content: StatefulBuilder(builder: (context, setState) {
        return SizedBox(
          height: 300,
          child: Column(
            children: [
              NumberPicker(
                  minValue: 0,
                  maxValue: 220,
                  itemCount: 5,
                  value: selectedWeight,
                  onChanged: onChanged),
            ],
          ),
        );
      }),
      actions: [
        TextButton(
          child: const Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],

      // Container(
      //   height: size.height*0.8,
      //   width: size.width*0.3,
      //   child: Text("")),
    );
  }

  genderPicker(Size size) {
    return Container(
      height: size.height * 0.06,
      width: size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          color: const Color(0xFFF7F8F8)),
      child: DropdownButtonFormField(
        borderRadius: BorderRadius.circular(18.0),
        value: value,
        items: items.map(buildMenuItems).toList(),
        onChanged: (value) => setState(() => this.value = value as String?),
        validator: (value) => value == null ? "Choose gender" : null,
        iconEnabledColor: const Color(0xFFF7F8F8),
        decoration: inputDecoration(const Color(0xFFF7F8F8), "Choose gender",
            prefixIcon: SvgPicture.asset(
              "assets/icons/light/2 User.svg",
              color: kGrayColor1,
            ),
            suffixIcon: SvgPicture.asset(
              "assets/icons/light/Arrow - Down 2.svg",
              color: kGrayColor1,
            )),
      ),

      // DropdownButtonHideUnderline(
      //   child: DropdownButton<String>(
      //     value: value,
      //     iconSize: 25,
      //     hint: Text(
      //       "Gender",
      //       style: kLargeTextRegular(kGrayColor1),
      //     ),
      //     icon: SvgPicture.asset(
      //       "assets/icons/light/Arrow - Down 2.svg",
      //       color: kGrayColor1,
      //     ),
      //     isExpanded: true,
      //     items: items.map(buildMenuItems).toList(),
      //     onChanged: (value) => setState(() => this.value = value as String?),
      //   ),
      // ),
    );
  }

  DropdownMenuItem<String> buildMenuItems(String item) => DropdownMenuItem(
        value: item,
        child: Text(item, style: kMediumTextRegular(kBlackColor)),
      );
}
