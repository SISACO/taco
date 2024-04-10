import 'package:Taco/screens/HomePage.dart';
import 'package:Taco/screens/SignIN.dart';
import 'package:Taco/screens/SignUP.dart';
import 'package:Taco/screens/resetPass.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demoo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SignInScreen(),
      routes: {
        '/homepage':(context) => HomeScreen(),
        '/signin':(context) => SignInScreen(),
        '/signup':(context) => SignUpScreen(),
        '/resetpass':(context) => ResetPassScrn(),
      },
    );
  }
}
