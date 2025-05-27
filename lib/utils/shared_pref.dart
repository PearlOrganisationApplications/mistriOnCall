  import 'package:mistri_on_call_new/constant/app_exports.dart';

  class SharedPrefsService extends GetxService {
    late SharedPreferences _prefs;

    Future<SharedPrefsService> init() async {
      _prefs = await SharedPreferences.getInstance();
      return this;
    }

    Future<void> saveToken(String token) async {
      await _prefs.setString('auth_token', token);
    }

    String? getToken() {
      print('token-- ${_prefs.getString('auth_token')}');
      return _prefs.getString('auth_token');
    }

    // New method to check if the user has seen the packages screen
    bool hasSeenPackages() {
      return _prefs.getBool('hasSeenPackages') ?? false;
    }

    // New method to set that the user has seen the packages screen
    Future<void> setHasSeenPackages(bool value) async {
      await _prefs.setBool('hasSeenPackages', value);
    }

    // New method to save the package status
    Future<void> savePackageStatus(String status) async {
      await _prefs.setString('package_status', status);
    }

    // New method to retrieve the package status
    String? getPackageStatus() {
      return _prefs.getString('package_status');
    }

    // New methods to save package details
    Future<void> savePackageDetails({required String packageId, required double price, required String validityDate}) async {
      await _prefs.setString('package_id', packageId);
      await _prefs.setDouble('package_price', price);
      await _prefs.setString('package_validity_date', validityDate); // Store the validity date
    }

    // Corrected method to retrieve the validity date
    Future<String?> getPackageValidityDate() async {
      return _prefs.getString('package_validity_date'); // No need to await here as _prefs is already initialized
    }

    // Methods to retrieve package details
    String? getPackageId() {
      return _prefs.getString('package_id');
    }

    double? getPackagePrice() {
      return _prefs.getDouble('package_price');
    }

    /// clear shared preference file:
    Future<void> clearSharedPref() async {
      await _prefs.remove('auth_token');
      await _prefs.remove('package_status');
      await _prefs.remove('package_id');
      await _prefs.remove('package_price');
      await _prefs.remove('package_validity_date');
    }
  }
