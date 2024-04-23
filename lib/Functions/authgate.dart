import 'package:Taco/reuse/NavBar.dart';
import 'package:Taco/screens/SignIN.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SignInScreen();
        }

        return tacoNavbar();
      },
    );
  }
}

Future<void> signOut(BuildContext context) async {
  await FirebaseAuth.instance
      .signOut()
<<<<<<< HEAD
      .then((value) => Navigator.pushNamedAndRemoveUntil(context, '/taconavbar', (route) => false));
=======
      .then((value) => Navigator.pushNamedAndRemoveUntil(context, '/signin', (route) => false));
>>>>>>> 4f59f58dffd8787c46c52304e643247a93bc37e3
}
