import 'package:mistri_on_call_new/constant/app_exports.dart';
import 'package:mistri_on_call_new/views/pages/top_service.dart';
import '../../controller/category_controller.dart';
import '../../service/category_api.dart';
import '../widget/category_box.dart';
import 'all_categories.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool status = true;
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: SvgPicture.asset(
                  "assets/icons/drawerIcon.svg",
                  color: secondaryColor,
                  height: 32.h,
                ),
              );
            },
          ),
          title: GestureDetector(
            onTap: () {
              final SharedPrefsService sharedPrefs =
                  Get.find<SharedPrefsService>();
              print('token-- ${sharedPrefs.getToken()}');
            },
            child: commonText('Mistrioncal', 18, secondaryColor,
                FontWeight.w400, TextAlign.center),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        drawer: appdrawer(userController: userController),
        body: appPadding(
          horiPadding: 8,
          vertPadding: 10,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ImageSlider(),
                SizedBox(height: 15.h),

                // Popular Categories Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonText(
                      'Popular Categories',
                      16,
                      primaryColor,
                      FontWeight.w600,
                      TextAlign.center,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(
                            () => CategoryListScreen(),
                            transition: Transition.circularReveal,
                            duration: Duration(milliseconds: 1000),
                          );
                        },
                        child: Text(
                          'See All',
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ))
                  ],
                ),
                SizedBox(height: 10.h),

                // Adjust height of CategoryGrid
                SizedBox(height: 350.h, child: CategoryGrid()),

                SizedBox(height: 10.h),

                // Top Services Section
                commonText(
                  'Top Services',
                  16,
                  primaryColor,
                  FontWeight.w600,
                  TextAlign.center,
                ),
                SizedBox(height: 10.h),
                TopServicesListScreen(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ));
  }
}

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController =
        Get.put(CategoryController(CategoryApi()));
    return Obx(() {
      if (categoryController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (categoryController.categories.isEmpty) {
        return Center(
          child: commonText('No categories found', 16, primaryColor,
              FontWeight.w600, TextAlign.center),
        ); // Display a message if no categories are found
      } else {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 170.w, // Adjust width for better spacing
            crossAxisSpacing: 10.w, // More space between items
            mainAxisSpacing: 10.h,
          ),
          itemCount: categoryController.categories.length,
          itemBuilder: (context, index) {
            final category = categoryController.categories[index];
            return CategoryBox(
              text: category.name,
              imgPath: category.image,
              categoryId: category.id,
              voidcallback: () {
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
    });
  }
}

class Item {
  final String imageUrl;
  final String name;
  final String price;

  Item({
    required this.imageUrl,
    required this.name,
    required this.price,
  });
}

class ItemContainer extends StatelessWidget {
  final Item item;

  const ItemContainer({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.imageUrl,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  item.price,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.bookmark_border,
            color: lightGrey20,
          )
        ],
      ),
    );
  }
}
