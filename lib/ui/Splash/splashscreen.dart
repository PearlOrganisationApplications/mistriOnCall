import 'package:flutter/material.dart';
import 'package:mistrioncall/ui/Splash/splashscreensec.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the next screen after the delay
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SplashScreenSec(), // Replace with your next screen widget
        ),
      );
    });

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.asset(
            'assets/images/logo_splash.png', // Replace with your image URL
            width: 200.0, // Set the desired width
            height: 200.0, // Set the desired height
            fit: BoxFit.cover, // Set the BoxFit property as needed
          ),
        ),
      ),
    );
  }
}
