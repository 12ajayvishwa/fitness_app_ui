import 'package:flutter/material.dart';
import '../utils/colors.dart';

class SwitchTabBar extends StatefulWidget {
  final Size size;
  const SwitchTabBar({Key? key, required this.size}) : super(key: key);

  @override
  State<SwitchTabBar> createState() => _SwitchTabBarState();
}

class _SwitchTabBarState extends State<SwitchTabBar> {
   
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        height: widget.size.height*0.085,
        width: widget.size.width*0.96,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: const Color(0xFFF7F8F8)
        ),
        child: TabBar(
          indicatorPadding: const EdgeInsets.all(10.0),
          unselectedLabelColor: kGrayColor2,
          labelStyle: const TextStyle(fontFamily: "Poppins",fontSize: 16,fontWeight: FontWeight.w400),
          indicator: BoxDecoration(
             borderRadius: BorderRadius.circular(99),
            gradient: const LinearGradient(colors: [kBrandColor1, kBrandColor2]),
            
          
          ),
          tabs : [Tab(text:'Photos'),Tab(text:'Statics')]),
      ),
    );
  }
}