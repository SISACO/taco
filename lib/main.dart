import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Taco',
    theme: ThemeData(
      useMaterial3: true,
    ),
    home: HomeScreen(),
    routes: {
      '/homepage': (context) => HomeScreen(),
      '/signin': (context) => SignInScreen(),
      '/signup': (context) => SignUpScreen(),
      '/resetpass': (context) => ResetPassScrn(),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Example'),
      ),
      body: MapWidget(),
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.509364, -0.128928),
        zoom: 9.2,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(51.509364, -0.128928),
              builder: (ctx) => Container(
                child: FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
      children: [
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () {
                // Handle onTap action if needed
              },
            ),
          ],
        ),
      ],
    );
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: Text('Sign In Screen'),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Text('Sign Up Screen'),
      ),
    );
  }
}

class ResetPassScrn extends StatelessWidget {
  const ResetPassScrn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Center(
        child: Text('Reset Password Screen'),
      ),
    );
  }
}
