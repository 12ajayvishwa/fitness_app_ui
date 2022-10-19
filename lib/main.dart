import 'package:fitness_ui/screens/complete_profile/registration-2.dart';
import 'package:fitness_ui/screens/login_signup_screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'screens/complete_profile/completed_profile_screen.dart';
import 'screens/complete_profile/registration-1.dart';
import 'screens/login_signup_screens/login_screen.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: CompletedProfileScreen()
    );
  }
}