import 'package:firebase_auth/firebase_auth.dart';
import 'package:mistri_on_call_new/constant/app_exports.dart';
import 'package:http/http.dart' as http;

class ApiFunction {
  late final SharedPrefsService sharedPref;

  ApiFunction() {
    sharedPref = Get.find<SharedPrefsService>();
  }

  Future<void> loginUser(String phone, String password) async {
    print('phone-- $phone');
    try {
      final response = await http.post(
        Uri.parse(ApiUrls.login),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'phone': '91${phone}',
          // 'phone': phone,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Success--- ${response.body}');

        final token = data['api_token'];
        final validity = data['validity'] ?? 'N/A';
        final package = data['package'];

        if (token != null) {
          await sharedPref.saveToken(token);

          if (package != null) {
            final packagePrice = package['price'] ?? 0;
            final packageId = package['id'] ?? 0;

            await sharedPref.savePackageDetails(
              packageId: packageId.toString(),
              price: packagePrice.toDouble(),
              validityDate: validity,
            );

            print('Validity: $validity');
            print('Package Price: $packagePrice');
          } else {
            print('Package details not available on first login.');
          }
          print('Login successful: ${data['message']}');
          Get.snackbar(
            'Login Successful', // Title of the snackbar
            '${data['message']}', // Message in the snackbar
            icon: Icon(Icons.check, color: Colors.green),
            // Icon for the snackbar
            snackPosition: SnackPosition.BOTTOM,
            // Position of the snackbar (optional)
            duration: Duration(
                seconds:
                    3), // Duration for which the snackbar is visible (optional)
          );

          Get.offNamed('/dash');
        } else {
          Get.snackbar(
            'Token not found in response', // Title of the snackbar
            '${data['message']}', // Message in the snackbar
            icon: Icon(Icons.check, color: Colors.green),
            // Icon for the snackbar
            snackPosition: SnackPosition.BOTTOM,
            // Position of the snackbar (optional)
            duration: Duration(
                seconds:
                    3), // Duration for which the snackbar is visible (optional)
          );
          print('Token not found in response');
        }
      } else {
        final errorData = jsonDecode(response.body);

        commonDialogBox(
            'Login Failed',
            errorData['message'] ?? 'Please check the details',
            'cancel',
            'Ok', () {
          Navigator.of(Get.context!).pop();
        });

        print('Login failed data: ${errorData}');
      }
    } catch (error) {
      print('An error occurred: $error');
    }
  }

  Future<void> signupUser({phone, password}) async {
    try {
      final requestBody =
          json.encode({'phone': '91${phone}', 'password': password});

      print('Request Body: $requestBody');

      final response = await http.post(
        Uri.parse(ApiUrls.sigunUp),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'phone': '91${phone}',
          'password': password,
        }),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        print('Signup successful');
        print(response.body);
        print(response.statusCode);
        Get.offNamed('/login');
      } else {
        final errorData = json.decode(response.body);
        commonDialogBox(
            'Signup Failed', errorData['message'].toString(), 'cancel', 'Ok',
            () {
          Navigator.of(Get.context!).pop();
        });
        // Handle errors
        print("signup failed data: ${response.body}");
        print('Signup failed: ${errorData['message']}');
      }
    } catch (error) {
      print('An error occurred: $error');
    }
  }
}

class GoogleLoginApiFunction {
  late final SharedPrefsService sharedPref;

  GoogleLoginApiFunction() {
    sharedPref = Get.find<SharedPrefsService>();
  }

  Future<void> googleLoginUser(UserCredential userCredential) async {

    if (userCredential.user == null) {
      print('User is null');
      return;
    }
    print('email-- ${userCredential.user!.email}');
    try {
      final response = await http.post(
        Uri.parse(ApiUrls.sociacLogin),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': userCredential.user!.displayName,
          'email': userCredential.user!.email,
          // 'token': userCredential.credential!.token,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Success--- ${response.body}');

        final token = data['api_token'];
        final validity = data['validity'] ?? 'N/A';
        final package = data['package'];

        if (token != null) {
          await sharedPref.saveToken(token);

          if (package != null) {
            final packagePrice = package['price'] ?? 0;
            final packageId = package['id'] ?? 0;

            await sharedPref.savePackageDetails(
              packageId: packageId.toString(),
              price: packagePrice.toDouble(),
              validityDate: validity,
            );

            print('Validity: $validity');
            print('Package Price: $packagePrice');
          } else {
            print('Package details not available on first login.');
          }
          print('Login successful: ${data['message']}');
          Get.snackbar(
            'Login Successful',
            '${data['message']}',
            icon: Icon(Icons.check, color: Colors.green),
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
          );

          Get.offNamed('/dash');
        } else {
          Get.snackbar(
            'Token not found in response',
            '${data['message']}',
            icon: Icon(Icons.check, color: Colors.green),
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
          );
          print('Token not found in response');
        }
      } else {
        final errorData = jsonDecode(response.body);

        commonDialogBox(
            'Login Failed',
            errorData['message'] ?? 'Please check the details',
            'cancel',
            'Ok', () {
          Navigator.of(Get.context!).pop();
        });

        print('Login failed data: ${errorData}');
      }
    } catch (error) {
      print('An error occurred: $error');
    }
  }


  // Future<void> signupUser({phone, password}) async {
  //   try {
  //     final requestBody =
  //         json.encode({'phone': '91${phone}', 'password': password});
  //
  //     print('Request Body: $requestBody');
  //
  //     final response = await http.post(
  //       Uri.parse(ApiUrls.sigunUp),
  //       headers: {'Content-Type': 'application/json'},
  //       body: json.encode({
  //         'phone': '91${phone}',
  //         'password': password,
  //       }),
  //     );
  //     if (response.statusCode == 201 || response.statusCode == 200) {
  //       print('Signup successful');
  //       print(response.body);
  //       print(response.statusCode);
  //       Get.offNamed('/login');
  //     } else {
  //       final errorData = json.decode(response.body);
  //       commonDialogBox(
  //           'Signup Failed', errorData['message'].toString(), 'cancel', 'Ok',
  //           () {
  //         Navigator.of(Get.context!).pop();
  //       });
  //       // Handle errors
  //       print("signup failed data: ${response.body}");
  //       print('Signup failed: ${errorData['message']}');
  //     }
  //   } catch (error) {
  //     print('An error occurred: $error');
  //   }
  // }


  // Future<void> googleLoginUser() async {
  //   final url = 'https://api.mistrioncal.com/public/api/login-with-google';
  //   final callbackScheme = 'myapp';
  //
  //   try {
  //     final result = await FlutterWebAuth.authenticate(
  //         url: url, callbackUrlScheme: callbackScheme);
  //
  //     // final token = Uri.parse(result).queryParameters['email'];
  //     print('Login successful. Token: $result');
  //     // print('Login successful. Token: $token');
  //
  //     // You can now store the token or use it for API calls
  //   } catch (e) {
  //     print('Login failed: $e');
  //   }
  // }


  Future<void> signupUser({phone, password}) async {
    try {
      final requestBody =
          json.encode({'phone': '91${phone}', 'password': password});

      print('Request Body: $requestBody');

      final response = await http.post(
        Uri.parse(ApiUrls.sigunUp),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'phone': '91${phone}',
          'password': password,
        }),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        print('Signup successful');
        print(response.body);
        print(response.statusCode);
        Get.offNamed('/login');
      } else {
        final errorData = json.decode(response.body);
        commonDialogBox(
            'Signup Failed', errorData['message'].toString(), 'cancel', 'Ok',
            () {
          Navigator.of(Get.context!).pop();
        });
        // Handle errors
        print("signup failed data: ${response.body}");
        print('Signup failed: ${errorData['message']}');
      }
    } catch (error) {
      print('An error occurred: $error');
    }
  }
}
