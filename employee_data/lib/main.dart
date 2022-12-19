import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:employee_data/employee_details.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
      initialRoute: '/',
      routes: {
        '/employees-list': (context) => const HomePage(),
        '/employee-details': (context) => const EmployeeDetails(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/logo.png',
      nextScreen: const HomePage(),
      duration: 3000,
      curve: Curves.easeIn,
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
