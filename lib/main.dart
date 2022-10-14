import 'package:flutter/material.dart';
import 'home.dart';
import 'screens/onboarding_screen/onboarding_screen.dart';
import 'screens/onboarding_screen/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home:OnboardingScreen()
    );
  }
}