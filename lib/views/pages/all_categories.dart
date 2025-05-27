import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mistri_on_call_new/views/pages/service_screen.dart';

import '../../constant/appColor.dart';
import '../../controller/category_controller.dart';
import '../../service/category_api.dart';
import '../widget/category_box.dart';
import '../widget/text_widget.dart';

class CategoryListScreen extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController(CategoryApi()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, color: secondaryColor),
        ),
        title: commonText('All Categories', 20, secondaryColor, FontWeight.w400,
            TextAlign.center),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() { // This makes the UI reactive
        if (categoryController.isLoading.value) {
          // Show loading indicator while categories are being fetched
          return Center(child: CircularProgressIndicator());
        } else if (categoryController.categories.isEmpty) {
          // Show message if no categories are found
          return Center(child: Text("No categories found."));
        } else {
          // Show the list of categories once fetched
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 170.w, // Adjust width for better spacing
              crossAxisSpacing: 10.w, // More space between items
              mainAxisSpacing: 10.h,
            ),
            itemCount: categoryController.categories.length,
            itemBuilder: (context, index) {
              final category = categoryController.categories[index];
              return
                CategoryBox(
                  text: category.name,
                  imgPath: category.image,
                  categoryId: category.id,
                  voidcallback: (){
                    Get.to(
                          () => ServiceScreen(),
                      arguments: category.id.toString(),
                      transition: Transition.circularReveal,
                      duration: Duration(milliseconds: 1000),
                    );
                  },


                );




            },
          );
        }
      }),
    );
  }
}

