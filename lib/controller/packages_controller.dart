import 'package:mistri_on_call_new/constant/app_exports.dart';
import 'package:http/http.dart' as http;


class PackageController extends GetxController {
  var packages = <Package>[].obs;
  var isLoading = true.obs;
  var selectedPackageIndex = Rxn<int?>();

  @override
  void onInit() {
    fetchPackages();
    super.onInit();
  }

  void fetchPackages() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(ApiUrls.packages));
      if (response.statusCode == 200) {
        print('packages data : ${response.body}');
        var jsonData = json.decode(response.body);

        // Access packages from the "packages" key in the JSON response
        var packagesList = (jsonData['packages'] as List)
            .map((package) => Package.fromJson(package))
            .toList();
        packages.assignAll(packagesList);
      } else {
        Get.snackbar('Error', 'Failed to load packages');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading(false);
    }
  }
}
