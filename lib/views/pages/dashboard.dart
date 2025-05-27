import 'package:mistri_on_call_new/constant/app_exports.dart';
import '../dialog/exit_dilaog.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final List<Widget> pageList = [
     HomeScreen(),
    const Booking(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());
    return Obx(
          () => WillPopScope(
            onWillPop: exitDialogBox,
            child: Scaffold(
                    body: pageList[controller.tabIndex],
                    resizeToAvoidBottomInset: false,
                    bottomNavigationBar: controller.tabIndex == 4
              ? null
              : Container(
            height: 65,
            color: secondaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavigationBarItem(
                  icon: Icons.home,
                  label: 'Home',
                  isActive: controller.tabIndex == 0,
                  onTap: () => controller.setTabIndex = 0,
                ),
                _buildBottomNavigationBarItem(
                  icon: Icons.calendar_month_outlined,
                  label: 'Booking',
                  isActive: controller.tabIndex == 1,
                  onTap: () => controller.setTabIndex = 1,
                ),
                _buildBottomNavigationBarItem(
                  icon: Icons.settings,
                  label: 'Settings',
                  isActive: controller.tabIndex == 2,
                  onTap: () => controller.setTabIndex = 2,
                ),
              ],
            ),
                    ),
                  ),
          ),
    );
  }


  Widget _buildBottomNavigationBarItem({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: isActive
          ? Container(

        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: secondaryColor,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(color: secondaryColor, fontSize: 12),
            ),
          ],
        ),
      )
          : Icon(
        icon,
        color: primaryColor,
        size: 24,
      ),
    );
  }
}





