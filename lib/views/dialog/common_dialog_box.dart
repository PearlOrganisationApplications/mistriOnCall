import 'package:mistri_on_call_new/constant/app_exports.dart';


Future<bool> commonDialogBox(String title, String contentText, String cancelText, String confirmText, VoidCallback confirmAction) {
  return Get.defaultDialog(
    title: title,
    middleText: contentText,
    backgroundColor: Colors.white,
    titleStyle: const TextStyle(
        color: primaryColor, fontSize: 22, fontWeight: FontWeight.bold),
    middleTextStyle: const TextStyle(color: Colors.black, fontSize: 16),
    radius: 10,
    textCancel: cancelText,
    textConfirm: confirmText,
    confirmTextColor: Colors.white,
    cancelTextColor: primaryColor,
    buttonColor: primaryColor,

    onConfirm:  confirmAction
  ).then((value) => value ?? false);
}
