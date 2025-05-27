import 'package:mistri_on_call_new/constant/app_exports.dart';

class BookingController extends GetxController {
  final BookingService _bookingService = Get.find();

  void navigateToTab(int tabIndex) {
    final controller = Get.find<AppController>();
    controller.setTabIndex =
        tabIndex; // Set the tab index passed as an argument
    Get.off(() => DashboardScreen());
  }

  var bookingData = {}.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> bookService({
    required String serviceId,
    required String bookingDate,
    required String location,
  }) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _bookingService.bookService(
        serviceId: serviceId,
        bookingDate: bookingDate,
        location: location,
      );

      if (response.containsKey('message') &&
          response['message'] == "Service booked successfully!") {
        bookingData.value = response['booking'];

        // Show success dialog
        Get.dialog(
          AlertDialog(
            title: Text('Success'),
            content: Text(response['message']),
            actions: [
              TextButton(
                onPressed: () {
                  navigateToTab(1);
                },
                child: Text('OK'),
              ),
            ],
          ),
          barrierDismissible: false,
        );
      } else {
        // Handle unexpected responses or failure messages
        errorMessage.value = response['message'] ?? 'Booking failed';
        Get.snackbar(
          'Error',
          errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      errorMessage.value = 'An error occurred';
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
