import 'package:mistri_on_call_new/constant/app_exports.dart';
import 'dart:io';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  File? _profileImage;
  final ImageSelector _imageSelector = ImageSelector();
  final UserController controller = Get.put(UserController());
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
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),

                  /// Account Form Start here
                  formData('Full Name', 'Enter your name', TextInputType.name,
                      controller.usernameController),
                  // formData('Last Name', 'Enter name', TextInputType.name,
                  //     controller.lnameController),
                  formData('Email', 'Enter email', TextInputType.emailAddress,
                      controller.emailController),
                  formData('Password', 'Enter password', TextInputType.text,
                      controller.passwordController),
                  formData('Phone', 'Enter number', TextInputType.phone,
                      controller.phoneController),
                  formData('Address', 'Enter address', TextInputType.text,
                      controller.addressController),
                  const SizedBox(height: 30),
                  Center(
                    child: commonbtn1(
                      'Save changes',
                      14,
                      //btnTextSize
                      () {
                        controller.updateUser(
                          username:
                              controller.usernameController.text.isNotEmpty
                                  ? controller.usernameController.text
                                  : null,
                          email:
                              controller.emailController.text.isNotEmpty
                                  ? controller.emailController.text
                                  : null,
                          password:
                              controller.passwordController.text.isNotEmpty
                                  ? controller.passwordController.text
                                  : null,
                          contactNumber:
                              controller.phoneController.text.isNotEmpty
                                  ? controller.phoneController.text
                                  : null,
                          address: controller.addressController.text.isNotEmpty
                              ? controller.addressController.text
                              : null,
                        );
                      },
                      primaryColor,
                      secondaryColor,
                      btnHeight: 50,
                      btnWidth: 160,
                      vertPadding: 12,
                      horizPadding: 14,
                      borderRadius: 15,
                    ),
                  )
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
