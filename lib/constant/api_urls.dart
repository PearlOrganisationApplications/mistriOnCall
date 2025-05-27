class ApiUrls{
  // Base URL
  static const String baseUrl = "https://api.mistrioncal.com/public/api";

  // Endpoints
  static const String login = "$baseUrl/login";
  static const String sigunUp = "$baseUrl/appsignup";
  static const String banner = "$baseUrl/banner";
  static const String categories = "$baseUrl/categories";
  static const String packages = "$baseUrl/packages";
  static const String getUser= "$baseUrl/getuser";
  static const String updateUser= "$baseUrl/updateUser";
  static const String getServices="$baseUrl/get-services";
  static const String getBooking = "$baseUrl/bookings";
  static const String createBooking = "$baseUrl/bookings";
  static const String purchasePackage = "$baseUrl/purchase-package";
  static const String markComplete = '$baseUrl/booking-status';
  static const String fetchTopService = '$baseUrl/topservices';
  static const String fetchAllCategory = '$baseUrl/categories';
  // static const String sociacLogin = '$baseUrl/login-with-google';
  static const String sociacLogin = '$baseUrl/google-login';

}