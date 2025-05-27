import 'package:flutter/material.dart'; // Ensure to import material.dart
import 'package:mistri_on_call_new/constant/app_exports.dart';
import 'package:intl/intl.dart';

class PackageDetails extends StatefulWidget {
  @override
  _PackageDetailsState createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  final SharedPrefsService sharedPrefs = Get.find<SharedPrefsService>();

  String? packageId;
  double? price;
  String? validityDate;

  @override
  void initState() {
    super.initState();
    packageId = sharedPrefs.getPackageId();
    price = sharedPrefs.getPackagePrice();
    _loadValidityDate(); // Load the validity date
  }

  Future<void> _loadValidityDate() async {
    validityDate = await sharedPrefs.getPackageValidityDate();
    setState(() {}); // Update the state to reflect changes in UI
  }

  String formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) {
      return 'N/A';
    }

    try {
      DateTime dateTime = DateTime.parse(dateStr);
      return DateFormat('dd MMM yyyy').format(dateTime);
    } catch (e) {
      return 'Invalid date';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: secondaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: commonText('Your Existing Plan', 20, secondaryColor,
            FontWeight.w400, TextAlign.center),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonText2(
                        'Package Details', 16, FontWeight.w600, primaryColor),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        commonText2('Price', 14, FontWeight.w500, appBlack),
                        commonText2('₹ ${price?.toStringAsFixed(2) ?? 'N/A'}',
                            14, FontWeight.w600, Colors.green),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        commonText2('Validity', 14, FontWeight.w500, appBlack),
                        commonText2(formatDate(validityDate), 14,
                            FontWeight.w500, appBlack),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/packages');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: commonText2(
                    'Upgrade Plan', 14, FontWeight.w600, Colors.white),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
