import 'package:get/get.dart';
import '../models/categories_model.dart';
import '../service/all_category.dart';
import '../service/category_api.dart';

class CategoryController extends GetxController {
  RxInt selectedCategoryId = 0.obs;
  var categories = <Category>[].obs;
  var isLoading = true.obs;

  final CategoryApi api;

  CategoryController(this.api);

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      categories.value = await api.fetchCategories();
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      isLoading(false);
    }
  }

  void setSelectedCategory(int categoryId) {
    selectedCategoryId.value = categoryId;
  }
}
