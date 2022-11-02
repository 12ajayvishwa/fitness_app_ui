import 'package:fitness_ui/routes/custom_route.dart';
import 'package:fitness_ui/routes/route_constant.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness',
      onGenerateRoute: CustomRouter.generateRoute,
<<<<<<< HEAD
      initialRoute: breakFastScreenRoute,
=======
      initialRoute: mealPlannerScreenRoute,
>>>>>>> 2f8716359e584bede0997f4a7763801836e57803
    );
  }
}
