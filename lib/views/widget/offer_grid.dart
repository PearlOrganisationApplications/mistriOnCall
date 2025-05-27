import 'package:mistri_on_call_new/constant/app_exports.dart';


// class CategoryGrid extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final AppController categoryController = Get.put(AppController());
//     return Obx(() {
//       if (categoryController.isLoading.value) {
//         return const Center(child: CircularProgressIndicator());
//       } else {
//         return GridView.builder(
//           physics: const NeverScrollableScrollPhysics(),
//           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//             maxCrossAxisExtent: 110.w, // Maximum width of each item
//             crossAxisSpacing: 6.w, // Horizontal spacing between items
//             mainAxisSpacing: 6.h, // Vertical spacing between items
//           ),
//           itemCount: categoryController
//               .categories.length, // Use the length of the category list
//           itemBuilder: (context, index) {
//             final category = categoryController.categories[index];
//             return CategoryBox(
//               text: category.name,
//               imgPath: category.categoryImage,
//             );
//           },
//         );
//       }
//     });
//   }
// }

class CategoryBox extends StatelessWidget {
  final String text;
  final String imgPath;

  const CategoryBox({Key? key, required this.text, required this.imgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateToServiceTab() {
      final controller = Get.find<AppController>();
      controller.setTabIndex = 2; // 2 is the index for the Service tab
      Get.to(() => DashboardScreen(), arguments: text);
    }
    return GestureDetector(
      onTap: navigateToServiceTab,
      child: Column(
        children: [
          Container(
            // padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: lightGrey, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imgPath,
                fit: BoxFit.cover,
                // Adjust height as needed
              ),
            ),
          ),
          Text(text)
        ],
      ),
    );
  }
}

class ServiceCategory {
  final String name;
  final String imgPath; // Path to an icon image representing the category

  ServiceCategory({required this.name, required this.imgPath});
}
