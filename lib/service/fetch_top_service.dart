import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mistri_on_call_new/constant/api_urls.dart';

import '../models/top_service.dart';

class FetchTopService {
  static Future<List<TopService>> fetchTopServices() async {
    final url = Uri.parse(ApiUrls.fetchTopService); // Replace with your API endpoint.

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((serviceJson) => TopService.fromJson(serviceJson)).toList();
    } else {
      throw Exception('Failed to fetch top services');
    }
  }
}
