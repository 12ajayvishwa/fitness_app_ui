import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/text_style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(body: Center(child: Container(
        height: 500,
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              kSecondryColor1,
              kSecondryColor2
            ])
        ),
        child: Column(children: [
          Text("Hello everyone!",style: kTitleH1Bold),
          Text("Hello everyone!",style: kTitleH1SemiBold),
          Text("Hello everyone!",style: kTitleH1Medium),
          Text("Hello everyone!",style: kTitleH1Regular),

          Text("Hello everyone!",style: kTitleH2Bold),
          Text("Hello everyone!",style: kTitleH2SemiBold),
          Text("Hello everyone!",style: kTitleH2Medium),
          Text("Hello everyone!",style: kTitleH2Regular)
        ]),
      ),),)
    );
  }
}