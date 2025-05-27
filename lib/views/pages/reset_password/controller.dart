import 'package:mistri_on_call_new/constant/app_exports.dart';

import '../../../utils/helper.dart';

class ResetPassController extends GetxController {
  var isLoggedIn = false.obs;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    isLoggedIn.value = Get.arguments ?? false;
  }

  Future<void> ResetPass() async {
    const url = 'https://api.mistrioncal.com/public/api/change-password';

    try {
      final response =
          await ApiHelper.apiRequest(url: url, method: ApiMethodes.post, body: {
        'phone': "91${phoneController.text}",
        'password': passwordController.text,
        'confirm_password': confirmPasswordController.text
      });
      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Response data: ${response.body}');
        Helper.showSnackbar('Success', '${responseData['message']}', color: Colors.blue);
        Get.offAll(() => LoginScreen());
      } else {
        Helper.showSnackbar('Error', '${responseData['message']}');
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
