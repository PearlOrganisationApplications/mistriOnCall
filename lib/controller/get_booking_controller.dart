import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mistri_on_call_new/constant/api_urls.dart';

import '../models/get_booking_model.dart';
import '../utils/shared_pref.dart';

class GetBookingController extends GetxController {

  var allBookings = <GetBookingData>[];
  var upcomingBookings = <GetBookingData>[];
  var previousBookings = <GetBookingData>[];

  // Loading state
  var isLoading = false.obs;
  var isError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBookings();
  }

  // Fetch bookings from the API
  void fetchBookings() async {
    try {
      isLoading(true);
      isError(false);

      var response = await getBookingsFromApi();

      if (response != null && response['bookings'] != null) {
        allBookings = response['bookings'].map<GetBookingData>((booking) {
          return GetBookingData.fromJson(booking);
        }).toList();

        DateTime now = DateTime.now();

        // Filter upcoming bookings (future bookings)
        upcomingBookings = allBookings.where((booking) {
          DateTime? bookingDate = tryParseDate(booking.bookingDate);
          return bookingDate != null && bookingDate.isAfter(now) && booking.status != 'completed';
        }).toList();

        // Filter previous bookings (past bookings or completed bookings)
        previousBookings = allBookings.where((booking) {
          DateTime? bookingDate = tryParseDate(booking.bookingDate);
          return bookingDate != null && (bookingDate.isBefore(now) || booking.status == 'completed');
        }).toList();
      } else {
        isError(true);  // If no bookings or error in response
      }
    } catch (e) {
      isError(true);
      print('Error fetching bookings: $e');
    } finally {
      isLoading(false);
    }
  }

  // Safe date parsing
  DateTime? tryParseDate(String dateStr) {
    try {
      return DateTime.tryParse(dateStr);
    } catch (e) {
      print('Error parsing date: $e');
      return null;
    }
  }


  Future<Map<String, dynamic>> getBookingsFromApi() async {
    final SharedPrefsService sharedPrefs = Get.find<SharedPrefsService>();

    final url = ApiUrls.getBooking;

    try {

      final headers = {
        'Authorization': 'Bearer ${sharedPrefs.getToken()}', // Add Bearer token here
        'Content-Type': 'application/json', // Content type if needed
      };

      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {

        final Map<String, dynamic> data = json.decode(response.body);

        return data;
      } else {
        throw Exception('Failed to load bookings');
      }
    } catch (e) {
      print('Error fetching bookings: $e');
      return {
        'bookings': [],
      };
    }
  }

  Future<bool> approveBooking(String bookingId, String status) async {
    print('booking id $bookingId');
    print('booking status $status');
    try {

      final SharedPrefsService sharedPrefs = Get.find<SharedPrefsService>();

      final requestBody = json.encode({
        'id': bookingId,
        'status': status, // New status
      });

      // Make API call to approve the booking
      final response = await http.post(
        Uri.parse(ApiUrls.markComplete), // Replace with your API URL for updating booking status
        headers: {
          'Authorization': 'Bearer ${sharedPrefs.getToken()}',
          'Content-Type': 'application/json',
        },
        body: requestBody,
      );

      if (response.statusCode == 200) {
        print('success : ${response.body}');
        // If the request was successful, update the UI or state accordingly
        return true;
      } else {
        print('failed : ${response.statusCode}');
        // Handle failed API response
        print('Failed to approve booking: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error approving booking: $e');
      return false;
    }
  }
}
