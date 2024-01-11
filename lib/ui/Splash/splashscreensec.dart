import 'package:flutter/material.dart';

import '../Welcome/onboardingscreens.dart';

class SplashScreenSec extends StatelessWidget {
  const SplashScreenSec({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the next screen after the delay
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              OnboardingScreen(), // Replace with your next screen widget
        ),
      );
    });

    return const Scaffold(
      backgroundColor: Colors.black, // Set the background color
    );
  }
}
