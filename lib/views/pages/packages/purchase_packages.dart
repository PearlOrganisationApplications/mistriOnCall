import 'package:mistri_on_call_new/constant/app_exports.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageSelectionScreen extends StatefulWidget {
  @override
  State<PackageSelectionScreen> createState() => _PackageSelectionScreenState();
}

class _PackageSelectionScreenState extends State<PackageSelectionScreen> {
  final SharedPrefsService sharedPrefs = Get.find<SharedPrefsService>();

  final PackageController packageController = Get.put(PackageController());

  final ScrollController _scrollController = ScrollController();
  final RazorPayIntegration _razorPayIntegration = RazorPayIntegration();

  String? packagePrice;
  int? packageID;
  String? savedPackageId;



  @override
  void initState() {
    super.initState();
    _razorPayIntegration.intiateRazorPay();
    savedPackageId = sharedPrefs.getPackageId();
  }

  @override
  void dispose() {
    _razorPayIntegration.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: commonText('Select Packages', 20, secondaryColor,
            FontWeight.w400, TextAlign.center),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() {
        // Checking the loading state
        if (packageController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (packageController.packages.isEmpty) {
          return const Center(child: Text('No Packages Found'));
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(packageController.packages.length,
                          (index) {
                        var package = packageController.packages[index];
                        bool isPurchased =
                            savedPackageId == package.id.toString();
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 8, vertical: 15),
                          width: 310,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                package.name,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 10),
                              RichText(
                                  text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'Rs ${package.price.toString()}',
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                TextSpan(
                                  text: '/m',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )
                              ])),
                              SizedBox(height: 10),
                              Text(
                                'This plan includes:',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  listItem('Premium Customer Support'),
                                  listItem(
                                      'Experienced & Trained Professionals'),
                                  listItem('Flexible Scheduling Options'),
                                  listItem('Satisfaction Guarantee'),
                                  listItem('Comprehensive Service Coverage'),
                                  listItem('Eco-Friendly Cleaning Products'),
                                ],
                              ),
                              SizedBox(height: 30),
                              Center(
                                child: !isPurchased
                                    ?
                                Obx((){
                                  if (_razorPayIntegration.isLoading.value) {
                                    return Center(child: CircularProgressIndicator(),);
                                  }
                                  else { return ElevatedButton(
                                    onPressed: () {
                                      print('packagePrice ${package.price.toString()}');
                                      print('packageID ${package.id}');
                                      _razorPayIntegration.openSession(
                                        amount: package.price,
                                        packageId: package.id,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryColor,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 20),
                                    ),
                                    child: Text(
                                      'Get this Package',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                  );
                                  }
                                })
                                    : Text(
                                        'Existing Plan',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: primaryColor),
                                      ),
                              ),
                              Spacer(),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  await sharedPrefs.setHasSeenPackages(true);
                  Get.offNamed('/dash');
                },
                child: commonText2('Skip', 16, FontWeight.w600, primaryColor),
              ),
            ],
          );
        }
      }),
    );
  }

}

Widget listItem(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Icon(Icons.check, size: 20, color: Colors.black),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
      ],
    ),
  );
}


