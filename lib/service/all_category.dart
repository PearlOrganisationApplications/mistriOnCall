import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mistri_on_call_new/constant/api_urls.dart';
import 'dart:convert';

import '../models/categories_model.dart';
import '../utils/shared_pref.dart';

class CategoryApiService {

  static Future<List<Category>> fetchCategories() async {
    final SharedPrefsService sharedPrefs = Get.find<SharedPrefsService>();
    final token = sharedPrefs.getToken();

    final url = Uri.parse(ApiUrls.fetchAllCategory);

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);

        return responseData.map((data) => Category.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }
}
