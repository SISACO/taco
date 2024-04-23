import 'package:Taco/screens/HomePage.dart';
import 'package:Taco/screens/ProfilePage.dart';
import 'package:Taco/screens/SignIN.dart';
import 'package:Taco/screens/SignUP.dart';
import 'package:Taco/screens/locationpage.dart';
import 'package:Taco/screens/locationdetails.dart';
import 'package:Taco/screens/map.dart';
import 'package:Taco/screens/resetPass.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Taco/reuse/NavBar.dart';
import 'package:Taco/screens/CommunityPage.dart';
import 'firebase_options.dart';
<<<<<<< HEAD
import 'package:Taco/Functions/authgate.dart';
=======
>>>>>>> 2f99a1e0a535a845350dd34efb198b5fed368fdd

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
   
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
=======
>>>>>>> 2f99a1e0a535a845350dd34efb198b5fed368fdd
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taco',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(
         Theme.of(context).textTheme,
       ),
      ),
      home: const AuthGate(),
      routes: {
<<<<<<< HEAD
        '/homepage':(context) => HomeScreen(),
        '/signin':(context) => SignInScreen(),
        '/signup':(context) => SignUpScreen(),
        '/resetpass':(context) => ResetPassScrn(),
        '/community':(context) => CommunityPage(),
        '/taconavbar':(context) => tacoNavbar(),
        '/profilescreen':(context)=> ProfileScreen()
      },
    );
  }
}
=======
        '/homepage': (context) => HomeScreen(),
        '/signin': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/resetpass': (context) => ResetPassScrn(),
      },
    );
  }
}
>>>>>>> 2f99a1e0a535a845350dd34efb198b5fed368fdd
