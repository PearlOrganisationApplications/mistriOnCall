import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:mistri_on_call_new/constant/app_exports.dart';
import 'package:url_launcher/url_launcher.dart';

// Future<bool> commonDialogBox1(String title, String contentText,
//     String cancelText, String confirmText, VoidCallback confirmAction) {
//   return Get.defaultDialog(
//       title: title,
//       middleText: contentText,
//       backgroundColor: Colors.white,
//       titleStyle: const TextStyle(
//           color: primaryColor, fontSize: 22, fontWeight: FontWeight.bold),
//       middleTextStyle: const TextStyle(color: Colors.black, fontSize: 16),
//       radius: 10,
//       textCancel: cancelText,
//       textConfirm: confirmText,
//       confirmTextColor: Colors.white,
//       cancelTextColor: primaryColor,
//       buttonColor: primaryColor,
//       onConfirm: confirmAction)
//       .then((value) => value ?? false);
// }

Future<bool> commonDialogBox(
  String title,
  String contentText,
  String cancelText,
  String confirmText,
  VoidCallback confirmAction,
) {
  return Get.dialog(
    AlertDialog(
      title: Center(
          child: Text(
        title,
        style: TextStyle(
            color: primaryColor, fontSize: 22, fontWeight: FontWeight.bold),
      )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            contentText,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          InkWell(
            onTap: () {
              _launchURL('https://www.mistrioncal.com/privacy-policy');
            },
            overlayColor: WidgetStateColor.transparent,
            child: Text(
              'Privacy Policy',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
          )
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: secondaryColor,
      actions: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(30),
          ),
          child: InkWell(
            onTap: () {
              Get.back(result: false);
            },
            overlayColor: WidgetStateColor.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                cancelText,
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            confirmAction();
            Get.back(result: true);
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(primaryColor),
          ),
          child: Text(
            confirmText,
            style: TextStyle(color: secondaryColor),
          ),
        ),
      ],
    ),
  ).then((value) => value ?? false);
}

void _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri,
        mode: LaunchMode.externalApplication); // Launch in browser
  } else {
    throw 'Could not launch $url';
  }
}
