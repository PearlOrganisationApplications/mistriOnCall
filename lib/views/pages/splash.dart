import 'package:mistri_on_call_new/constant/app_exports.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    // Use Stream or Rx to react to login status changes
    return Obx(() {
      if (authController.isLoggedIn.value) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else {
        return const Scaffold(
          // backgroundColor: Color(0xFF0D689D),
          backgroundColor: primaryColor,
          body:
              Center(child: Image(image: AssetImage('assets/images/logo.png'))),
        );
      }
    });
  }
}
