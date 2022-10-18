import 'package:fitness_ui/utils/text_style.dart';
import 'package:flutter/material.dart';


class Registration2 extends StatefulWidget {
  const Registration2({Key? key}) : super(key: key);

  @override
  State<Registration2> createState() => _Registration2State();
}

class _Registration2State extends State<Registration2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("What is your goal ?",style: kTitleH4Bold(const Color(0xFF1D1617)),)
          ],
        ),
      ),
    );
  }
}