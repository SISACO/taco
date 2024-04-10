import 'package:Taco/theme/theme_helper.dart';
import 'package:Taco/widgets/Tapbar/tabBarIndicator.dart';
import 'package:flutter/material.dart';

AppBar tabBar(BuildContext context) {
  return AppBar(
    backgroundColor: appTheme.whiteA700,
    elevation: 0,
    iconTheme: IconThemeData(
      color: appTheme.indigo400,
      size: 35,
    ),
    centerTitle: true,
    title: Text("Register",
        style: TextStyle(fontWeight: FontWeight.w900, color: appTheme.indigo400)),

    bottom: TabBar(
      indicatorPadding: EdgeInsets.only(left: 18,right: 18,bottom: 3),
      labelColor: appTheme.indigo400,
      unselectedLabelColor:appTheme.blue200Af,
      indicator: OutlineIndicator(
        color: appTheme.bluebox,
      ),
      // indicatorWeight: 0,
      indicatorSize: TabBarIndicatorSize.tab,
      // indicatorColor: appTheme.blue200Af,
      tabs: [
        
        Tab(
          child: Text(
             "User",
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
          ),
        ),
        Tab(
          child: Text(
            "Partner",
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
          ),
        ),
      ],
    ),
  );
}