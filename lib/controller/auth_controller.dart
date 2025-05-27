import 'package:mistri_on_call_new/constant/app_exports.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  final apiFunction = ApiFunction();

  @override
  void onReady() {
    super.onReady();
    _checkLoginStatus();
    _navigateBasedOnLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final SharedPrefsService sharedPrefs = Get.find<SharedPrefsService>();
    final token = sharedPrefs.getToken();

    isLoggedIn.value = token != null;
  }

  void _navigateBasedOnLoginStatus() {
    final SharedPrefsService sharedPrefs = Get.find<SharedPrefsService>();
    if (isLoggedIn.value) {
      if (!sharedPrefs.hasSeenPackages()) {
        Get.offNamed('/packages');
      } else {
        Get.offNamed('/dash');
      }
    } else {
      Get.offNamed('/login');
    }
  }
}
