// home.dart

import 'package:Taco/screens/locationdetails.dart';
import 'package:flutter/material.dart';
import 'package:Taco/screens/locationpage.dart';
import 'package:location/location.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<LocationData?>(
          future: checkLocationService(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.error != null || snapshot.data == null) {
              return Center(child: Text('Failed to get location'));
            } else {
              return Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: LocationMap(locationData: snapshot.data),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocationMap()),
                        );
                      },
                      child: Container(
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            "Location Details",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  checkLocationService() {}
}
