  import 'package:mistri_on_call_new/constant/app_exports.dart';
  import 'package:http/http.dart' as http;
  import 'dart:convert'; // Add this import for json.decode()

  class   AppController extends GetxController {
    /// Tab Bar Controller
    RxInt _tabIndex = 0.obs;

    int get tabIndex => _tabIndex.value;

    set setTabIndex(int newValue) {
      _tabIndex.value = newValue;
    }

    final SharedPrefsService sharedPrefs = Get.find<SharedPrefsService>();

    /// Image slider controller
    static RxInt currentIndex = 0.obs;


  }
