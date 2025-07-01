import 'package:mistri_on_call_new/constant/app_exports.dart';
import 'package:url_launcher/url_launcher.dart';

Widget profileTile(IconData firstContIcon, String tileText, String routeOrUrl) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          if (routeOrUrl.startsWith('http')) {
            // If it's a URL, launch the URL
            _launchURL(routeOrUrl);
          } else {
            // Otherwise, navigate to the route
            Get.toNamed(routeOrUrl);
          }
        },
        overlayColor: WidgetStateColor.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          padding: const EdgeInsets.only(bottom: 15, top: 8),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: lightGrey, width: 0.5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: thirdColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      firstContIcon,
                      color: appBlack,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 15),
                  commonText(
                    tileText,
                    14,
                    appBlack,
                    FontWeight.w500,
                    TextAlign.center,
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: thirdColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: appBlack,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget commonIcons(IconData icon) {
  return Icon(
    icon,
    color: lightGrey,
    size: 22,
  );
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

Widget notificationTile(IconData firstContIcon, String tileText,
    String routeName, RxBool switchValue, Function(bool) onToggle) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(routeName);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: thirdColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(
                      firstContIcon,
                      color: appBlack,
                      size: 20.r,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  commonText(tileText, 14.sp, appBlack, FontWeight.w500,
                      TextAlign.center)
                ],
              ),
              Obx(() => Transform.scale(
                    scale: 0.9, // Adjust the scale factor as needed
                    child: Switch(
                      trackOutlineColor: MaterialStateProperty.all(appBlack),
                      value: switchValue.value,
                      activeColor: appBlack,
                      thumbColor: MaterialStateProperty.all(secondaryColor),
                      activeTrackColor: appBlack,
                      inactiveTrackColor: appBlack.withOpacity(0.2),
                      onChanged: onToggle,
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        const Divider(
          color: lightGrey,
          thickness: 0.5,
        )
      ],
    ),
  );
}
