import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant/appColor.dart';
import '../../controller/create_booking.dart';
import '../../utils/shared_pref.dart';
import '../widget/common_botton.dart';
import '../widget/text_widget.dart';
import 'common_dialog_box.dart';

class BookingSheet {
  Future bottomSheet(BuildContext context, String serviceId) {
    final BookingController bookingController = Get.put(BookingController());
    TextEditingController bookingDateController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    DateTime selectedDate = DateTime.now(); // Initialize with the current date
    TimeOfDay selectedTime =
        TimeOfDay.now(); // Initialize with the current time

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (pickedDate != null && pickedDate != selectedDate) {
        selectedDate = pickedDate;

        // Optionally allow the user to select a specific time
        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: selectedTime,
        );

        if (pickedTime != null) {
          selectedTime = pickedTime;

          // Create a DateTime object with both the selected date and time
          DateTime formattedDate = DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            selectedTime.hour,
            selectedTime.minute,
          );

          // Format the date and time as needed for the API
          bookingDateController.text =
              "${formattedDate.year.toString().padLeft(4, '0')}-" // YYYY
              "${formattedDate.month.toString().padLeft(2, '0')}-" // MM
              "${formattedDate.day.toString().padLeft(2, '0')} " // DD
              "${formattedDate.hour.toString().padLeft(2, '0')}:" // HH
              "${formattedDate.minute.toString().padLeft(2, '0')}:00"; // MM:SS
        }
      }
    }

    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      // This ensures the bottom sheet can adjust to keyboard visibility
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // Ensure the column takes minimum space
            children: [
              commonText2('Book Service', 18, FontWeight.w500, primaryColor),
              GestureDetector(
                onTap: () => _selectDate(context),
                // Show the date picker when tapped
                child: AbsorbPointer(
                  child: formData(
                    'Booking Date',
                    'select the date',
                    TextInputType.datetime,
                    bookingDateController,
                  ),
                ),
              ),
              formData('Address', 'enter address', TextInputType.name,
                  locationController),
              const SizedBox(height: 10),
              // Add spacing between the form fields and the button
              Center(
                child: commonbtn1(
                  'Confirm Booking',
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
                      bookingController.bookService(
                        serviceId: serviceId,
                        bookingDate: bookingDateController.text,
                        location: locationController.text,
                      );
                    }
                  },
                  primaryColor,
                  secondaryColor,
                  btnHeight: 35,
                  btnWidth: 130,
                  vertPadding: 3,
                  horizPadding: 8,
                  borderRadius: 30,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              // Add padding to avoid overlap with the keyboard
            ],
          ),
        ),
      ),
    );
  }
}
