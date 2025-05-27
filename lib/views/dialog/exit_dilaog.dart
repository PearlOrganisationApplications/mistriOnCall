import 'package:mistri_on_call_new/constant/app_exports.dart';

Future<bool> exitDialogBox() {
  return Get.defaultDialog(
    title: 'Exit App',
    middleText: 'Are you sure you want to exit the app?',
    backgroundColor: Colors.white,
    titleStyle: TextStyle(
        color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
    middleTextStyle: TextStyle(color: Colors.black, fontSize: 16),
    radius: 10,
    textCancel: 'No',
    textConfirm: 'Yes',
    confirmTextColor: Colors.white,
    cancelTextColor: Colors.black,
    buttonColor: primaryColor,
    onCancel: () {
      Get.back();
    },
    onConfirm: () {
      SystemNavigator.pop();
    },
  ).then((value) => value ?? false);
}
