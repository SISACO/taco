import 'package:Taco/screens/HomePage.dart';
import 'package:Taco/screens/SignIN.dart';
import 'package:Taco/screens/SignUP.dart';
import 'package:Taco/screens/resetPass.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taco',
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


