import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/gradient_text_color.dart';
import 'package:fitness_ui/widgets/card_components/custom_switch.dart';
import 'package:fitness_ui/widgets/daily_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool switchbutton = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Profile",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
              height: size.height*1.14,
              width: size.width,
              child: Column(
                children: [
                  topContainer(size),
                  const SizedBox(
                    height: 25,
                  ),
                  top2Container(size),
                  const SizedBox(
                    height: 40,
                  ),
                  accountSection(size),
                  const SizedBox(
                    height: 40,
                  ),
                  notificationSection(
                      size,
                      CustomSwitch(
                        value: true,
                        onChanged: (v) {
                          setState(() {
                            switchbutton = v;
                          });
                        },
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  otherSection(size)
                ],
              )),
        ),
      ),
    );
  }

  otherSection(Size size){
    return Container(
      height: size.height * 0.3,
      width: size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF1D1617).withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 5)
          ]),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: 20,
            left: 20,
            child: Text(
              "Others",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black),
            ),
          ),
          Positioned(
              bottom: 15,
              left: 15,
              right: 20,
              child: SizedBox(
                height: size.height * 0.2,
                width: size.width * 0.95,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      accountSectionRow(
                          "assets/icons/light/Message.svg", "Contact Us",
                          () {
                        // ignore: avoid_print
                        print("hi");
                      }),
                      accountSectionRow("assets/icons/light/Shield Done.svg",
                          "Privacy-Policy", () {}),
                      accountSectionRow("assets/icons/light/Setting.svg",
                          "Settings", () {}),
                    ]),
              ))
        ],
      ),
    ); 
  }

  notificationSection(Size size, Widget tabSwitch) {
    return Container(
      height: size.height * 0.14,
      width: size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF1D1617).withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 5)
          ]),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: 20,
            left: 20,
            child: Text(
              "Notification",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShaderMask(
                      child: SvgPicture.asset(
                        "assets/icons/light/Notification.svg",
                        height: 20,
                        width: 20,
                        color: Colors.white,
                      ),
                      shaderCallback: (Rect bounds) {
                        Rect rect = const Rect.fromLTRB(0, 0, 30, 30);
                        return const LinearGradient(
                                colors: [kBrandColor1, kBrandColor2],
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft)
                            .createShader(rect);
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Pop-up Notification",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: kGrayColor1),
                    ),
                  ],
                ),
               const  SizedBox(width: 120,),
                tabSwitch
              ],
            ),
          ),
        ],
      ),
    );
  }

  accountSection(Size size) {
    return Container(
      height: size.height * 0.3,
      width: size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF1D1617).withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 5)
          ]),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: 20,
            left: 20,
            child: Text(
              "Account",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black),
            ),
          ),
          Positioned(
              bottom: 15,
              left: 15,
              right: 20,
              child: SizedBox(
                height: size.height * 0.2,
                width: size.width * 0.95,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      accountSectionRow(
                          "assets/icons/light/Profile.svg", "Personal Data",
                          () {
                        print("hi");
                      }),
                      accountSectionRow("assets/icons/light/Document.svg",
                          "Achievement", () {}),
                      accountSectionRow("assets/icons/light/Graph.svg",
                          "Activity-History", () {}),
                      accountSectionRow("assets/icons/light/Chat.svg",
                          "Workout-Progress", () {}),
                    ]),
              ))
        ],
      ),
    );
  }

  accountSectionRow(String leading, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ShaderMask(
                child: SvgPicture.asset(
                  leading,
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ),
                shaderCallback: (Rect bounds) {
                  Rect rect = const Rect.fromLTRB(0, 0, 30, 30);
                  return const LinearGradient(
                          colors: [kBrandColor1, kBrandColor2],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft)
                      .createShader(rect);
                },
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: kGrayColor1),
              ),
            ],
          ),
          SvgPicture.asset(
            "assets/icons/light/Arrow - Right 2.svg",
            color: kGrayColor1,
          ),
        ],
      ),
    );
  }

  topContainer(Size size) {
    return SizedBox(
      height: size.height * 0.1,
      width: size.width * 0.9,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 10,
            child: Container(
              height: size.height * 0.18,
              width: size.width * 0.18,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    kBrandColor1.withOpacity(0.6),
                    kBrandColor2.withOpacity(0.6)
                  ])),
              child: Center(
                  child: SvgPicture.asset(
                "assets/images/Profile-Vector.svg",
                height: 80,
                width: 50,
              )),
            ),
          ),
          Positioned(
              left: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Stefani Wong",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  Text(
                    "Lose a Fat Program",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: kGrayColor1),
                  )
                ],
              )),
          Positioned(
              right: 10,
              child: Button(
                  size: size,
                  text: "Edit",
                  onTap: () {},
                  color1: kBrandColor1,
                  color2: kBrandColor2)),
        ],
      ),
    );
  }

  top2Container(Size size) {
    return SizedBox(
      width: size.width * 0.9,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        PersonalData(title: "180cm", subtitle: "Height", size: size),
        PersonalData(title: "65kg", subtitle: "Weight", size: size),
        PersonalData(title: "20yo", subtitle: "Age", size: size)
      ]),
    );
  }
}

class PersonalData extends StatelessWidget {
  final String title;
  final String subtitle;
  final Size size;
  const PersonalData(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      width: size.width * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF1D1617).withOpacity(0.07),
                spreadRadius: 2,
                offset: const Offset(0, 2),
                blurRadius: 2)
          ]),
      child: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    foreground: Paint()..shader = linearGradient2),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: kGrayColor1),
              )
            ]),
      ),
    );
  }
}
