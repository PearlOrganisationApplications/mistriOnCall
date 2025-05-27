import 'dart:io';
import 'package:mistri_on_call_new/constant/app_exports.dart';



class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;
  final ImageSelector _imageSelector = ImageSelector();
  final SharedPrefsService sharedPrefs = Get.find<SharedPrefsService>();
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: secondaryColor,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: appPadding(
        horiPadding: 8,

        vertPadding: 10,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),

              profileTile(Icons.person, 'Edit Details','/accountDetails' ),
              profileTile(Icons.credit_card, 'Package Details','/packageDetails' ),
              profileTile(Icons.privacy_tip_outlined, 'Privacy Policy', 'https://www.mistrioncal.com/privacy-policy/'),
               SizedBox(height: 300.h,),
              commonbtn2(
                'Logout',
                14,
                () async{
                  await sharedPrefs.clearSharedPref();
                  print('Token cleared');
                  Get.offAllNamed('/login');
                },
                primaryColor,
                secondaryColor,
                40, // height
                140, // width
                8, // vertical padding
                8, // horizontal padding
                15, // Border Radius
                Icons.logout_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
