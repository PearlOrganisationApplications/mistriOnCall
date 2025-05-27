import 'package:mistri_on_call_new/constant/app_exports.dart';

import '../../../constant/key.dart';


int? packageIdd;
int? amountt;
class RazorPayIntegration {
  final Razorpay _razorpay = Razorpay();
  final razorPayKey = RAZORPAY_KEY_ID;
  Map<String, dynamic>? paymentIntent;
  var isLoading = false.obs;
 // final PaymentStatusController paymentController = Get.put(PaymentStatusController());

  void intiateRazorPay() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void dispose() {
    _razorpay.clear();
  }
  String? transactionID;
  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    await purchasePackage(packageIdd.toString(), amountt!);

    // Show a success dialog with payment ID
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        title: Text('Payment Successful'),
        content: Text('Thank you for your payment!\nTransaction ID: ${response.paymentId}'),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Get.toNamed('/dash');
            },


          ),
        ],
      ),
    );



  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Show an error dialog when payment fails using GetX
    Get.dialog(
      AlertDialog(
        title: Text('Payment Failed'),
        content: Text('Oops! Something went wrong with your payment.'),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Get.back(); // Close the dialog
            },
          ),
        ],
      ),
    );
    print("Payment error: ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    print("External wallet selected: ${response.walletName}");
  }

  Future<void> openSession({required int amount, required int packageId}) async {
    isLoading.value = true; // Start loading
    try {
      packageIdd = packageId;
      amountt = amount;
      final orderId = await createOrder(amount: amount);
      if (orderId.isNotEmpty) {
        var options = {
          'key': razorPayKey,
          'amount': amount,
          'name': 'Mistrioncal',
          'order_id': orderId,
          'description': 'Description for order',
          'timeout': 120,
          'theme': {
            'color': '#081EB8',
          },
        };
        _razorpay.open(options);
      } else {
        print("Failed to create order");
      }
    } finally {
      isLoading.value = false; // Stop loading
    }
  }



  Future<String> createOrder({
    required num amount,
  }) async {
    final myData = await PaymentServices().razorPayApi(amount, "rcptid_11");
    if (myData["status"] == "success") {
      print(myData);
      return myData["body"]["id"];
    } else {
      print(myData);
      return "";
    }
  }


}
