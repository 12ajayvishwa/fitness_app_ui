import 'package:fitness_ui/screens/home/dashboard.dart';
import 'package:fitness_ui/routes/custom_route.dart';
import 'package:fitness_ui/screens/complete_profile/completed_profile_screen.dart';
import 'package:fitness_ui/screens/complete_profile/registration_1.dart';
import 'package:fitness_ui/screens/complete_profile/registration_2.dart';
import 'package:fitness_ui/screens/login_signup_screens/login_screen.dart';
import 'package:fitness_ui/screens/login_signup_screens/signup_screen.dart';
import 'package:fitness_ui/screens/onboarding_screen/onboarding_screen.dart';
import 'package:fitness_ui/screens/onboarding_screen/welcome_screen.dart';
import 'package:fitness_ui/screens/screen_not_found.dart';
import 'package:flutter/material.dart';

import '../screens/notifications_screen/notification_screen.dart';

class CustomRouter{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case welcomeScreenRoute:
      return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case onboardingScreenRoute:
      return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case signupScreenRoute:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case registrationOneScreenRoute:
      return MaterialPageRoute(builder: (_) => const RegistrationOne());
      case registration2ScreenRoute:
      return MaterialPageRoute(builder: (_) => const Registration2());
      case loginScreenRoute:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
      case completedProfileScreenRoute:
      return MaterialPageRoute(builder: (_) => const CompletedProfileScreen());
      case dashboardScreenRoute:
      return MaterialPageRoute(builder: (_) => const Dashboard());
      case notificationsScreenRoute:
      return MaterialPageRoute(builder: (_) => const Notifications());
      default:
      return MaterialPageRoute(builder: (_) => const ScreenNotFound());
      
    }
  }
}