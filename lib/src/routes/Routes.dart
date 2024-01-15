import 'package:flutter/material.dart';
import 'package:mistrioncall/ui/Welcome/loginscreen.dart';
import 'package:mistrioncall/ui/Welcome/signupscreen.dart';

import '../../ui/Splash/splashscreen.dart';
import '../../ui/Welcome/onboardingscreens.dart';
import '../../ui/user/home/home.dart';
import '../../utils/common_widgets/bottomNavigationBar.dart';

class Routes {
  static const String home = '/home';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String signUp = '/signUp';
  static const String login = '/login';
  static const String baseClass = '/base';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => Home());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case baseClass:
        return MaterialPageRoute(builder: (_) => MyBottomNavigationBar());

      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      default:
        // If the route is not found, you can handle it here
        return MaterialPageRoute(builder: (_) => NotFoundScreen());
    }
  }
}

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Found Screen'),
      ),
      body: Center(
        child: Text('404 - Route not found'),
      ),
    );
  }
}
