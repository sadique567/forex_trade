import 'package:flutter/material.dart';
import 'package:forex_trade/app/modules/watchList/watchlist_controller/watchlist_controller.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class WatchlistViews extends GetView<WatchlistController> {
  const WatchlistViews({super.key});
  // final _formKeyOtp = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => WatchlistController());

    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(50),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                controller: controller.emailControllerOtp,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hint: Text("enter Email"),
                  label: Text("Email"),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.sendOtp();
                      // Get.snackbar("OTP send", "Sucessfully");
                    },
                    icon: Icon(Icons.forward),
                  ),
                ),
              ),
            ),
            const Text(
              "Enter OTP",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Pinput(
              controller: controller.pinController,
              length: 4, // OTP digits
              keyboardType: TextInputType.number,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.blue),
                ),
              ),
              showCursor: true,
              onCompleted: (pin) {
                controller.verifyOtpOnCompleted(pin);
              },
            ),
          ],
        ),
      ),
    );
  }
}
