import 'package:mistri_on_call_new/constant/app_exports.dart';
import 'package:http/http.dart' as http;

class FetchImages {
  Future<List<Map<String, dynamic>>> fetchBannerData() async {
    final response = await http.get(Uri.parse(ApiUrls.banner));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> banners = data['banners'];


      return banners.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load banners');
    }
  }
}
