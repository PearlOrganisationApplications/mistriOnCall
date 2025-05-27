import 'package:mistri_on_call_new/constant/app_exports.dart';
import 'package:mistri_on_call_new/utils/google_auth.dart';
import 'package:mistri_on_call_new/views/pages/reset_password/reset_pass_screen.dart';
import '../../utils/helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController authController = Get.find<AuthController>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                SizedBox(height: 80.h),
                Center(
                    child: Container(
                  height: MediaQuery.of(context).size.height * .15,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      // color: Colors.red,
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image:
                              AssetImage('assets/images/logo_background.png'))),
                )),
                SizedBox(height: 20.h),
                Center(
                  child: commonText(
                    AppString.login,
                    20.sp,
                    primaryColor,
                    FontWeight.w400,
                    TextAlign.center,
                  ),
                ),
                SizedBox(height: 20.h),
                phonetextField(
                    'phone', lightGrey, TextInputType.number, phoneController),
                SizedBox(height: 20.h),
                textField(
                  'Password',
                  lightGrey,
                  TextInputType.name,
                  passwordController,
                ),
                SizedBox(height: 20.h),
                commonbtn1(
                  'Login',
                  14,
                  // btnTextSize
                  () {
                    if (phoneController.text.isEmpty) {
                      Helper.showSnackbar('Error', 'Please enter phone number');
                    } else if (passwordController.text.isEmpty) {
                      Helper.showSnackbar('Error', 'Please enter password');
                    } else {
                      authController.apiFunction.loginUser(
                          phoneController.text, passwordController.text);
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
                SizedBox(height: 15.h),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Forgot Password?',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => ResetPassScreen());
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () => GoogleAuthHelper.signInWithGoogle(),
                        // onTap: () => googleLoginApi.googleLoginUser(),
                        overlayColor: WidgetStateColor.transparent,
                        child: Container(
                          width: Get.size.width * .35,
                          height: Get.size.width * .1,
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(.2),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: EdgeInsets.all(4),
                          child: Row(
                            children: [
                              Image.asset('assets/icons/google.png'),
                              SizedBox(width: 8),
                              Text(
                                'Google',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp),
                              )
                            ],
                          ),
                        )),
                    // SizedBox(width: 15.h),
                    // InkWell(
                    //     onTap: () => FacebookAuthHelper.signInWithFacebook(),
                    //     overlayColor: WidgetStateColor.transparent,
                    //     child: Container(
                    //       width: Get.size.width * .35,
                    //       height: Get.size.width * .1,
                    //       decoration: BoxDecoration(
                    //         color: primaryColor.withOpacity(.2),
                    //         borderRadius: BorderRadius.circular(100),
                    //       ),
                    //       padding: EdgeInsets.all(4),
                    //       child: Row(
                    //         children: [
                    //           Image.asset(
                    //             'assets/icons/facebook.png',
                    //             color: Colors.blue,
                    //           ),
                    //           SizedBox(width: 8),
                    //           Text(
                    //             'Facebook',
                    //             style: TextStyle(
                    //                 color: primaryColor,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 16.sp),
                    //           )
                    //         ],
                    //       ),
                    //     )),
                  ],
                ),
                SizedBox(height: 20.h),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Not Registered?  ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: lightGrey20,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Signup here',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.off(() => SignUpScreen());
                              // Get.toNamed('/signup');
                            },
                        ),
                      ],
                    ),
                  ),
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
