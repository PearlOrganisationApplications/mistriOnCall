import 'package:mistri_on_call_new/constant/app_exports.dart';
import 'package:http/http.dart' as http;



Future<void> purchasePackage(String packageId, int amount) async {
  final SharedPrefsService sharedPrefs = Get.find<SharedPrefsService>();

  final headers = {
    'Authorization': 'Bearer ${sharedPrefs.getToken()}',
    'Content-Type': 'application/json',
  };

  final body = jsonEncode({
    'package_id': packageId,
  });

  try {
    final response = await http.post(
      Uri.parse(ApiUrls.purchasePackage),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      print('success ---- ${response.statusCode}');
      print('Package purchased successfully!');

      // Extract the validity date from the API response
      final validityDate = responseData['user']['package_valid_till']; // Correct path to validity date

      // Save package details
      await sharedPrefs.savePackageDetails(
        packageId: packageId,
        price: amount.toDouble(),
        validityDate: validityDate, // Store the extracted validity date
      );

      await sharedPrefs.savePackageStatus("active");

    } else {
      print('Failed ---- ${response.statusCode}');
      print('Failed to purchase package: ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
  }
}


