import 'package:mistri_on_call_new/constant/app_exports.dart';
import 'package:http/http.dart' as http;

class BookingService extends GetxService {
  final SharedPrefsService sharedPrefs = Get.find<SharedPrefsService>();


  Future<Map<String, dynamic>> bookService({
    required String serviceId,
    required String bookingDate,
    required String location,
  }) async {
    final response = await http.post(
      Uri.parse(ApiUrls.createBooking),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${sharedPrefs.getToken()}',
      },
      body: jsonEncode(<String, String>{
        'service_id': serviceId,
        'booking_date': bookingDate,
        'location': location,
      }),
    );
print(bookingDate);
    if (response.statusCode == 201) {
      Navigator.of(Get.context!).pop();
      print('success :  ${response.statusCode}');
      print('booking body :  ${response.body}');
      return jsonDecode(response.body);
    } else {
      print('failed :  ${response.statusCode}');
      print('failed :  ${response.body}');

      throw Exception('Failed to create booking');
    }
  }
}

