import 'package:fitness_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: SizedBox(
                  height: size.height * 0.1,
                  width: size.width,
                  child: notificationsList(
                      size,
                      "assets/images/Food-Vector.svg",
                      "Hey, it’s time for lunch",
                      "About 1 minutes ago",
                      () {})),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: SizedBox(
                  height: size.height * 0.1,
                  width: size.width,
                  child: notificationsList(
                      size,
                      "assets/images/Train_Vector2.svg",
                      "Don’t miss your lowerbody workout",
                      "About 3 hours ago",
                      () {})),
            ),
          ],
        ),
      ),
    );
  }

  notificationsList(Size size, String image, String title, String subtitle,
      VoidCallback onTap) {
    return Container(
        height: size.height * 0.1,
        width: size.width * 0.9,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: kGrayColor3, width: 1))),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              height: size.height * 0.12,
              width: size.width * 0.12,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    kBrandColor1.withOpacity(0.4),
                    kBrandColor2.withOpacity(0.4)
                  ])),
              child: Center(
                child: SvgPicture.asset(
                  image,
                  height: 25,
                  width: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: size.height * 0.16,
              width: size.width * 0.55,
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1D1617)),
                    ),
                    Text(
                      subtitle,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: kGrayColor1),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            IconButton(
                onPressed: onTap,
                icon: const Icon(
                  Icons.more_vert,
                  color: kGrayColor2,
                ))
          ],
        ));
  }
}

class SmallContainer extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  const SmallContainer({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFF7F8F8),
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFF1D1617).withOpacity(0.07),
                  offset: const Offset(0, 4),
                  blurRadius: 2,
                  spreadRadius: 2)
            ]),
        child: Center(
            child: SvgPicture.asset(
          icon,
        )),
      ),
    );
  }
}
