
import 'package:http/http.dart' as http;
import 'package:mistri_on_call_new/constant/api_urls.dart';
import 'dart:convert';

import '../models/services_list_model.dart';

class ServiceApi {
  final String baseUrl;

  ServiceApi(this.baseUrl);

  Future<List<Service>> fetchServicesByCategory(int categoryId) async {
    final url = Uri.parse('${ApiUrls.getServices}/$categoryId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> serviceData = responseData['data']; // Get the 'data' key which is the list of services
      return serviceData.map((serviceJson) => Service.fromJson(serviceJson)).toList();
    } else {
      throw Exception('Failed to load services');
    }
  }
}
