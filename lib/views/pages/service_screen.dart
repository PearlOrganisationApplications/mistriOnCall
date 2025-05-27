import 'package:mistri_on_call_new/constant/app_exports.dart';
import '../../controller/category_controller.dart';
import '../../service/fetch_service.dart';
import '../dialog/booking_bottom_Sheet.dart';
import 'detaiil_service.dart';

class ServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int categoryId = int.parse(
        Get.arguments ?? '0'); // Get the category ID passed in arguments
    final serviceController =
        Get.put(ServiceController(ServiceApi('https://api.mistrioncal.com')));
    final categoryController = Get.find<CategoryController>();

    serviceController.fetchServices(categoryId);
    if (categoryId != 0) {
      categoryController.setSelectedCategory(categoryId);
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: secondaryColor),
          ),
          title: commonText('Services', 20, secondaryColor, FontWeight.w400,
              TextAlign.center),
          centerTitle: true,
          elevation: 0,
        ),
        body: Obx(() {
          if (serviceController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category Dropdown

                DropdownButton<int>(
                  value: categoryController.selectedCategoryId
                      .value, // Bind to the selected category ID
                  items: categoryController.categories.map((category) {
                    return DropdownMenuItem<int>(
                      value: category.id,
                      child: Text(category.name),
                    );
                  }).toList(),
                  onChanged: (newCategoryId) {
                    // Fetch services for the selected category
                    serviceController.fetchServices(newCategoryId!);

                    // Update the selected category ID in the controller
                    categoryController.setSelectedCategory(newCategoryId);
                  },
                ),

                // Display the services

                serviceController.services.isEmpty
                    ? Center(
                        child: Text(
                        'No services found.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ))
                    : Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 0.70,
                          ),
                          itemCount: serviceController.services.length,
                          itemBuilder: (context, index) {
                            final service = serviceController.services[index];
                            return ServiceCard(service: service);
                          },
                        ),
                      )
              ],
            ),
          );
        }));
  }
}

class ServiceCard extends StatelessWidget {
  final service;

  ServiceCard({required this.service});

  BookingSheet booking = BookingSheet();

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();
    final category = categoryController.categories.firstWhere(
      (category) => category.id == service.categoryId,
      orElse: () => Category(id: -1, name: 'Unknown', image: ''),
    );

    return InkWell(
      onTap: () {
        Get.to(() => ServiceDetailsScreen(service: service));
      },
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.network(
                service.image,
                height: 90,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Text(
                service.name,

                overflow:
                    TextOverflow.ellipsis, // Add ellipsis if text overflows
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: appBlack,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600], // Default text color
                  ),
                  children: [
                    const TextSpan(
                      text: 'Category: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500, // Style for the label
                      ),
                    ),
                    TextSpan(
                      text: category.name,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: commonbtn1(
                'Book Now',
                12,
                () {
                  final SharedPrefsService sharedPrefs =
                      Get.find<SharedPrefsService>();
                  if (sharedPrefs.getPackageStatus() == 'inactive' ||
                      sharedPrefs.getPackageStatus() == null ||
                      sharedPrefs.getPackageStatus() == '') {
                    commonDialogBox(
                        'Oops!!!',
                        "You don't have any Plan\n Purchase a plan first",
                        'cancel',
                        'Buy Plan', () {
                      Navigator.of(Get.context!).pop();
                      Get.toNamed('/packages');
                    });
                  } else if (sharedPrefs.getPackageStatus() == 'expired') {
                    commonDialogBox(
                        'Oops!!!',
                        "Your Plan is expired\n Purchase a plan first",
                        'cancel',
                        'Buy Plan', () {
                      Navigator.of(Get.context!).pop();
                      Get.toNamed('/packages');
                    });
                  } else {
                    booking.bottomSheet(context, service.id.toString());
                  }
                },
                primaryColor,
                secondaryColor,
                btnHeight: 36,
                btnWidth: 100,
                vertPadding: 3,
                horizPadding: 8,
                borderRadius: 30,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
