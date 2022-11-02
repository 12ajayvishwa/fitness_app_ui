import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../screens/notifications_screen/notification_screen.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({Key? key , required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallContainer(
                      icon: "assets/icons/light/Arrow - Left 2.svg",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                     Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    SmallContainer(
                      icon: "assets/icons/light/dot 2.svg",
                      onTap: () {},
                    ),
                  ],
                );
    
  }
}