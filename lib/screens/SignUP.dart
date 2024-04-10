import 'package:Taco/screens/signUpPatner.dart';
import 'package:Taco/screens/signUpUser.dart';
import 'package:Taco/widgets/Tapbar/TabBar.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: tabBar(context),
          body: TabBarView(
            children: [
              SignUpUser(),SignUpPatner()
            ],
          ),
        ),
      ),
    );
  }
}