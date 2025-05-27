import 'package:http/http.dart' as http;
import 'package:mistri_on_call_new/constant/api_urls.dart';
import 'dart:convert';

import '../models/categories_model.dart';

class CategoryApi {

  Future<List<Category>> fetchCategories() async {
    final url = Uri.parse(ApiUrls.categories);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((categoryJson) => Category.fromJson(categoryJson)).toList();
    } else {
      print('error cate : ${response.statusCode}');
      throw Exception('Failed to load categories');
    }
  }
}
