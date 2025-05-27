import 'package:mistri_on_call_new/models/services_list_model.dart';

class GetBookingModel {
  final String message;
  final List<GetBookingData> bookings;

  GetBookingModel({required this.message, required this.bookings});

  factory GetBookingModel.fromJson(Map<String, dynamic> json) {
    var bookingsJson = json['bookings'] as List?;
    List<GetBookingData> bookings = bookingsJson != null
        ? bookingsJson.map((e) => GetBookingData.fromJson(e)).toList()
        : [];

    return GetBookingModel(
      message: json['message'] ?? '',
      bookings: bookings,
    );
  }
}

class GetBookingData {
  final int id;
  final String bookingId;
  final int userId;
  final int serviceId;
  final String bookingDate;
  final String location;
  final String status;
  final Service? service;

  GetBookingData({
    required this.id,
    required this.bookingId,
    required this.userId,
    required this.serviceId,
    required this.bookingDate,
    required this.location,
    required this.status,
    this.service,
  });

  factory GetBookingData.fromJson(Map<String, dynamic> json) {
    return GetBookingData(
      id: json['id'] ?? 0,
      bookingId: json['booking_id'] ?? '',
      userId: json['user_id'] ?? 0,
      serviceId: json['service_id'] ?? 0,
      bookingDate: json['booking_date'] ?? '',
      location: json['location'] ?? '',
      status: json['status'] ?? '',
      service: json['service'] != null ? Service.fromJson(json['service']) : null,
    );
  }
}


