import 'package:Taco/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Text("Hai", style: TextStyle( color: appTheme.indigo400),),
          ),
        ),
      ),
    );
  }
}
