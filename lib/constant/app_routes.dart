import 'package:mistri_on_call_new/constant/app_exports.dart';
import '../views/pages/all_categories.dart';
import '../views/pages/packages/purchase_packages.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/login', page: () => const LoginScreen()),
    GetPage(name: '/signup', page: () => SignUpScreen()),
    GetPage(name: '/dash', page: () => DashboardScreen()),
    GetPage(name: '/saved_item', page: () => ServiceScreen()),
    GetPage(name: '/accountDetails', page: () => const AccountDetails()),
    GetPage(name: '/booking', page: () => const Booking()),
    GetPage(name: '/packageDetails', page: () => PackageDetails()),
    GetPage(name: '/packages', page: () => PackageSelectionScreen()),
    GetPage(name: '/allCategory', page: () => CategoryListScreen()),
  ];
}
