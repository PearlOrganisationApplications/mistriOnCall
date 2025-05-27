import 'package:http/http.dart' as http;
import 'package:mistri_on_call_new/constant/app_exports.dart';

class UserController extends GetxController {
  final SharedPrefsService sharedPrefs = Get.find<SharedPrefsService>();
  var user = User().obs;
  var isLoading = true.obs;

  // TextEditingControllers
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  void navigateToTab(int tabIndex) {
    final controller = Get.find<AppController>();
    controller.setTabIndex = tabIndex;
    Get.to(() => DashboardScreen());
  }

  Future<void> fetchUser() async {
    isLoading(true);
    final url = Uri.parse(ApiUrls.getUser);

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${sharedPrefs.getToken()}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['user'] != null) {
          user.value = User.fromJson(jsonResponse['user']);
          _initializeControllers(); // Initialize controllers with updated data
        } else {}
      }
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }

  void _initializeControllers() {
    usernameController.text = user.value.name ?? '';
    emailController.text = user.value.email ?? '';
    phoneController.text = user.value.phone?.toString() ?? '';
    addressController.text = user.value.location ?? '';
  }

  Future<void> updateUser(
      {String? username,
      // String? lastName,
      String? email,
      String? password,
      String? contactNumber,
      String? address}) async {
    if (contactNumber!.isEmpty || contactNumber.length != 10) {
      Get.snackbar('Failed', 'Please enter a valid phone number');
      return;
    }
    isLoading(true);
    try {
      final response = await http.post(
        Uri.parse(ApiUrls.updateUser),
        headers: {
          'Authorization': 'Bearer ${sharedPrefs.getToken()}',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'name': username,
          'email': email,
          'password': password,
          'contact_number': contactNumber,
          'location': address,
        }),
      );

      if (response.statusCode == 200) {
        print('response: ${response.body}');
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['user']['id'] != null) {
          user.value = User.fromJson(jsonResponse['user']);
          _initializeControllers();
          Get.snackbar('Success', 'User details updated successfully');
          Future.delayed(Duration(seconds: 2), () {
            navigateToTab(2);
          });
        } else {
          print('failure 1: ${response.body}');
        }
      } else {
        // Get.snackbar('Error', 'Failed to update user details');
      }
    } catch (e) {
      // Get.snackbar('Error', 'Failed to update user details');
    } finally {
      isLoading(false);
    }
  }
}
