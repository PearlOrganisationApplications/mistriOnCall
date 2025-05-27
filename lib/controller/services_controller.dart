import 'package:get/get.dart';

import '../models/services_list_model.dart';
import '../service/fetch_service.dart';


class ServiceController extends GetxController {
  var services = <Service>[].obs;
  var isLoading = true.obs;

  final ServiceApi api;

  ServiceController(this.api);

  Future<void> fetchServices(int categoryId) async {
    try {
      isLoading(true);
      services.value = await api.fetchServicesByCategory(categoryId);
    } catch (e) {
      print("Error fetching services: $e");
    } finally {
      isLoading(false);
    }
  }
}
