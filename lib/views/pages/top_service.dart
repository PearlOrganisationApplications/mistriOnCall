import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mistri_on_call_new/service/fetch_top_service.dart';
import '../../models/top_service.dart';
import 'detaiil_service.dart';

class TopServicesListScreen extends StatefulWidget {
  @override
  _TopServicesListScreenState createState() => _TopServicesListScreenState();
}

class _TopServicesListScreenState extends State<TopServicesListScreen> {
  late Future<List<TopService>> topServicesFuture;

  @override
  void initState() {
    super.initState();
    topServicesFuture = FetchTopService.fetchTopServices();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TopService>>  (
      future: topServicesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Failed to load top services.'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No top services available.'));
        }

        final services = snapshot.data!;

       return Column(
          children: [
            // Dynamically build the list of services
            ...services.map((service) => ServiceCard(service: service)).toList(),
          ],
        );

      },
    );
  }
}

class ServiceCard extends StatelessWidget {
  final TopService service;

  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ServiceDetailsScreen(service: service ));
      },
      child: Card(
        color: Colors.grey[50],
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  service.image,
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          service.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        Row(

                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                            const SizedBox(width: 4),
                            Text(
                              double.parse(service.averageRating).toStringAsFixed(1),
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                            ),

                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      service.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ),
                    const SizedBox(height: 8),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
