import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/buttons/custom_dropdown_button.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';
import '../../widgets/activity_status/activity_chart.dart';
import '../../widgets/banner_components/today_target_banner.dart';
import '../notifications_screen/notification_screen.dart';

class ActivityTracker extends StatefulWidget {
  const ActivityTracker({Key? key}) : super(key: key);

  @override
  State<ActivityTracker> createState() => _ActivityTrackerState();
}

class _ActivityTrackerState extends State<ActivityTracker> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: ListView(children: [
            TodayTargetBanner(size: size),
            const SizedBox(
              height: 40,
            ),
            firstRow(size),
            const SizedBox(
              height: 15,
            ),
            ActivityChart(
              size: size,
            ),
            const SizedBox(
              height: 15,
            ),
            secondRow(),
            latestActivitySection(size, "assets/images/Latest_Vector.svg",
                "Drinking 300ml Water", "About 3 minutes ago", () {}),
            latestActivitySection(size, "assets/images/Latest_Vector2.svg",
                "Eat Snack (Fitbar)", "About 10 minutes ago", () {})
          ]),
        ),
      ),
    );
  }

  latestActivitySection(Size size, String image, String title, String subtitle,
      VoidCallback onTap) {
    return Container(
      height: size.height * 0.1,
      width: size.width * 0.95,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                color: Color(0xFF1D1617).withOpacity(0.07),
                blurRadius: 2,
                spreadRadius: 2)
          ]),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 15,
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kBrandColor1.withOpacity(0.5),
              ),
              child: Center(
                child: SvgPicture.asset(image),
              ),
            ),
          ),
          Positioned(
              left: 80,
              child: Container(
                height: 55,
                width: 190,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: kSmallTextMedium(Colors.black),
                    ),
                    Text(subtitle,
                        style: kCaptionTextRegular(Color(0xFFA4A9AD))),
                  ],
                ),
              )),
          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: kGrayColor3,
                ),
                onPressed: onTap,
              ))
        ],
      ),
    );
  }

  Row secondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Latest Activity",
          style: kLargeTextSemiBold(const Color(0xFF1D1617)),
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              "See more",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: kGrayColor2),
            ))
      ],
    );
  }

  Row firstRow(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Activity Progress",
          style: kLargeTextSemiBold(const Color(0xFF1D1617)),
        ),
        CustomDropdownButton(size: size)
      ],
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Activity Tracker",
        style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SmallContainer(
          icon: "assets/icons/light/Arrow - Left 2.svg",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SmallContainer(
            icon: "assets/icons/light/dot 2.svg",
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
