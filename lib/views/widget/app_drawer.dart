import 'dart:ui';

import '../../constant/app_exports.dart';

Widget appdrawer({required UserController userController}) {
  final SharedPrefsService sharedPrefs = Get.find<SharedPrefsService>();

  void navigateToTab(int tabIndex) {
    final controller = Get.find<AppController>();
    controller.setTabIndex = tabIndex;
    Get.to(() => DashboardScreen());
  }

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));

  return Drawer(
      backgroundColor: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 190.h,
            width: double.infinity,
            // decoration: BoxDecoration(color: primaryColor),
            padding: const EdgeInsets.only(left: 20, right: 10, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100.h,
                  width: 260.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage(
                            'assets/images/logo_background.png')),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      "${userController.usernameController.text}  ",
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${userController.phoneController.text} ",
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  "${userController.addressController.text} ",
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Divider(color: primaryColor),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: [
                ListTile(
                  onTap: () {
                    Get.back();
                  },
                  leading: commonIcons(Icons.home),
                  title: commonText(
                      'Home', 16, appBlack, FontWeight.normal, TextAlign.left),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed('/accountDetails');
                  },
                  child: ListTile(
                    leading: commonIcons(Icons.person),
                    // Icon(),
                    title: commonText('Profile', 16, appBlack,
                        FontWeight.normal, TextAlign.left),
                  ),
                ),
                ListTile(
                  onTap: () {
                    navigateToTab(2);
                  },
                  leading: commonIcons(Icons.settings),
                  title: commonText('Settings', 16, appBlack, FontWeight.normal,
                      TextAlign.left),
                ),
                ListTile(
                  onTap: () async {
                    await sharedPrefs.clearSharedPref();
                    print('Token cleared');
                    Get.offAllNamed('/login');
                  },
                  leading: commonIcons(Icons.logout_outlined),
                  title: commonText('Logout', 16, appBlack, FontWeight.normal,
                      TextAlign.left),
                ),
              ],
            ),
          ),
        ],
      ));
}

Widget commonButton(
  VoidCallback onTap,
  String btnText,
  Color btnTextColor,
  Color btnColor,
  double btnHeight,
  double btnWidth,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: btnHeight,
      color: btnColor,
      width: btnWidth,
      child: Text(
        btnText,
        style: TextStyle(color: btnTextColor),
      ),
    ),
  );
}
