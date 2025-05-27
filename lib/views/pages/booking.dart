import 'package:intl/intl.dart';
import 'package:mistri_on_call_new/constant/app_exports.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final GetBookingController controller = Get.put(GetBookingController());

  @override
  void initState() {
    controller.fetchBookings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              initialIndex: 0,
              length: 3, // Number of tabs
              child: Scaffold(
                backgroundColor: Colors.grey[100],
                appBar: AppBar(
                  backgroundColor: primaryColor,
                  automaticallyImplyLeading: false,
                  title: const Text('Your Bookings',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  centerTitle: true,
                  elevation: 0,
                  bottom: const TabBar(
                    tabs: [
                      Tab(text: 'All'),
                      Tab(text: 'Upcoming'),
                      Tab(text: 'Previous'),
                    ],
                    unselectedLabelColor: appBlack,
                    labelColor: Colors.white,
                    indicatorColor: Colors.orange, // Replace with your color
                  ),
                ),
                body: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return TabBarView(
                    children: [
                      BookingListView(bookings: controller.allBookings),
                      BookingListView(bookings: controller.upcomingBookings),
                      BookingListView(bookings: controller.previousBookings),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookingListView extends StatelessWidget {
  final List<GetBookingData> bookings;

  BookingListView({required this.bookings});
  final GetBookingController controller = Get.put(GetBookingController());
  @override
  Widget build(BuildContext context) {
    if (bookings.isEmpty) {
      return Center(
          child: Text('No bookings available',
              style: TextStyle(fontSize: 18, color: Colors.grey)));
    }

    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: booking.status == 'pending'
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(
                        booking.service?.name ?? 'Service Name',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(booking.location,
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54)),
                          Text(_formatBookingDate(booking.bookingDate),
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54)),
                        ],
                      ),
                      trailing: Text(
                        booking.status.capitalizeFirst!,
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Column(
                            children: [
                              RichText(
                                  text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: 'Info: ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red[300],
                                    )),
                                TextSpan(
                                    text:
                                        'This service has been marked as completed by the admin. Please confirm if it is completed from your end as well.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                    ))
                              ])),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton.icon(
                                    onPressed: () async {
                                      bool success = await
                                      controller.approveBooking(booking.id.toString(), 'Reject');
        if (success) {
            // Optionally, update UI with success message or status change
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Booking approved successfully!')));
          } else {
             ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to approve booking')));
        }
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                    label: Text(
                                      'Reject',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  TextButton.icon(

                                      onPressed: () async {
                                        bool success = await
                                        controller.approveBooking(booking.id.toString(), 'confirmed');
                                        if (success) {
                                          controller.fetchBookings();
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Booking approved successfully!')));
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('Failed to approve booking')));
                                        }

                                    },
                                    icon: Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ),
                                    label: Text(
                                      'Approve',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        booking.service?.name ?? 'Service Name',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(booking.location,
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54)),
                          Text(_formatBookingDate(booking.bookingDate),
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54)),
                        ],
                      ),
                      trailing: Text(
                        booking.status.capitalizeFirst!,
                        style: TextStyle(
                            color: _getStatusColor(
                              booking.status,
                            ),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

  // Future<void> _approveBooking(BuildContext context, String bookingId) async {
  //   final controller = Get.find<GetBookingController>();
  //   bool success = await
  //   if (success) {
  //     // Optionally, update UI with success message or status change
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Booking approved successfully!')));
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Failed to approve booking')));
  //   }}
  String _formatBookingDate(String dateTime) {
    final DateTime parsedDate = DateTime.parse(dateTime);
    final DateFormat formatter = DateFormat('MM/dd/yyyy hh:mm a');
    return formatter.format(parsedDate);
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'scheduled':
        return Colors.blueAccent; // Light blue
      case 'pending':
        return Colors.orange.shade200; // Orange
      case 'confirmed':
        return Colors.green; // Green
      case 'completed':
        return Colors.green[900]!; // Dark green
      case 'cancelled':
        return Colors.red; // Red
      default:
        return Colors.grey; // Default color (in case status is unknown)
    }
  }
}
