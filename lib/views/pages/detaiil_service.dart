import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mistri_on_call_new/views/pages/service_screen.dart';

import '../../constant/appColor.dart';
import '../../models/services_list_model.dart';
import '../dialog/booking_bottom_Sheet.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final dynamic service;

  ServiceDetailsScreen({Key? key, required this.service}) : super(key: key);
  BookingSheet booking = BookingSheet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(service.name, style: TextStyle(color: Colors.white)),
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display service image
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  service.image,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              Text(
                service.name,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              Text(
                service.description,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 16),

              // Additional information (if any)
              Text(
                "Additional Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                service.description,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              const SizedBox(height: 24),

              // Reviews Section
              if (service.reviews.isNotEmpty) ...[
                Text(
                  "Reviews",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: service.reviews.length,
                  itemBuilder: (context, index) {
                    final review = service.reviews[index];
                    return ReviewTile(review: review);
                  },
                ),
              ] else ...[
                Text(
                  "No Reviews Yet",
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
              const SizedBox(height: 24),

              // Book Now Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    booking.bottomSheet(context, service.id.toString());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Book Now',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewTile extends StatelessWidget {
  final dynamic review;

  const ReviewTile({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User name and rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  review.userName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: List.generate(
                    5,
                        (index) => Icon(
                      index < review.rating ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Review text
            Text(
              review.review,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),

            // Review timestamp
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                review.createdAt.split('T')[0], // Show only the date part
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
