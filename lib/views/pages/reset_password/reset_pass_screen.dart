import 'package:mistri_on_call_new/constant/app_exports.dart';

import '../../../utils/helper.dart';
import 'controller.dart';

class ResetPassScreen extends StatelessWidget {
  ResetPassScreen({super.key});

  final ResetPassController controller =
      Get.put(ResetPassController(), tag: 'ResetPassController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50.h),
                Center(
                    child: Container(
                  height: MediaQuery.of(context).size.height * .15,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image:
                              AssetImage('assets/images/logo_virtucal.png'))),
                )),
                SizedBox(height: 80.h),
                Center(
                  child: commonText(
                    'Reset Password',
                    20.sp,
                    primaryColor,
                    FontWeight.w400,
                    TextAlign.center,
                  ),
                ),
                SizedBox(height: 20.h),
                textField(
                  'phone',
                  lightGrey,
                  TextInputType.number,
                  controller.phoneController,
                ),
                SizedBox(height: 20.h),
                textField(
                  'Password',
                  lightGrey,
                  TextInputType.name,
                  controller.passwordController,
                ),
                SizedBox(height: 20.h),
                textField(
                  'Confirm Password',
                  lightGrey,
                  TextInputType.name,
                  controller.confirmPasswordController,
                ),
                SizedBox(height: 20.h),
                commonbtn1(
                  'Submit',
                  14,
                  // btnTextSize
                  () {
                    if (controller.confirmPasswordController.text.isEmpty) {
                      Helper.showSnackbar(
                          'Error', 'Please enter confirm password');
                    } else if (controller.passwordController.text.isEmpty) {
                      Helper.showSnackbar('Error', 'Please enter password');
                    } else if (controller.phoneController.text.isEmpty) {
                      Helper.showSnackbar('Error', 'Please enter phone number');
                    } else {
                      if (controller.confirmPasswordController.text ==
                          controller.passwordController.text) {
                        controller.ResetPass();
                      } else {
                        Helper.showSnackbar('Error', 'Password does not match');
                      }
                    }
                  },
                  primaryColor,
                  secondaryColor,
                  btnHeight: 50,
                  btnWidth: 160,
                  vertPadding: 12,
                  horizPadding: 14,
                  borderRadius: 15,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
