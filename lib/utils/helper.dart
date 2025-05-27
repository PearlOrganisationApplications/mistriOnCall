import 'package:firebase_core/firebase_core.dart';
import '../constant/app_exports.dart';
import 'package:http/http.dart' as http;

class Helper {
  static String? appName = 'MistriOnCall';

  static void init() async {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: 'AIzaSyBksshH_PUaQX7HKXBnE1eMpcUEUVYm_ds',
      appId: '179838641367',
      messagingSenderId: '179838641367',
      projectId: 'mistrioncal-9de90',
    ));
  }

  static showSnackbar(String title, String message, {Color? color}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color ?? Colors.red,
      colorText: Colors.white,
    );
  }

  static loader({bool closeOnTab = false}) {
    Get.dialog(
      Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 150,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: closeOnTab,
    );
  }
}

class ApiHelper {
  static Future<http.Response> apiRequest({
    required String url,
    required String method,
    Map<String, dynamic>? body,
  }) async {
    final SharedPrefsService sharedPrefs = Get.find<SharedPrefsService>();
    final headers = {
      'Authorization': 'Bearer ${sharedPrefs.getToken()}',
      'Content-Type': 'application/json',
    };

    try {
      switch (method.toUpperCase()) {
        case 'GET':
          return await http.get(Uri.parse(url), headers: headers);

        case 'POST':
          return await http.post(
            Uri.parse(url),
            headers: headers,
            body: jsonEncode(body),
          );

        default:
          throw ArgumentError('Invalid HTTP method: $method');
      }
    } catch (e) {
      throw Exception('Failed to perform API request: $e');
    }
  }
}

class ApiMethodes {
  static String post = 'POST';
  static String get = 'GET';
}
