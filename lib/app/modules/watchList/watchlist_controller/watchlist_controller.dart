import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_otp/email_otp.dart';

class WatchlistController extends GetxController {
  final pinController = TextEditingController();
  final emailControllerOtp = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    EmailOTP.setSMTP(
      host: 'smtp.gmail.com',
      emailPort: EmailPort.port587,
      secureType: SecureType.tls,
      username: 'mss.cs567@gmail.com',
      password: 'ekqn guyd lkel gwkp',
    );

   

    EmailOTP.setTemplate(
      template: '''
      <div style="padding: 20px; font-family: Arial;">
        <h1>{{appName}}</h1>
        <p>Your OTP is <strong>{{otp}}</strong></p>
      </div>
      ''',
    );

    EmailOTP.config(
      appName: 'Forex Trade App',
      otpType: OTPType.numeric,
      expiry: 300000, // 5 minutes in milliseconds
      appEmail: 'mss.cs567@gmail.com',
      otpLength: 4,
    );

   
  }

  Future<void> sendOtp() async {
    final userEmail = emailControllerOtp.text.trim();
    if (userEmail.isEmpty) {
      Get.snackbar("Error", "Please enter email");
      return;
    }

    bool result = await EmailOTP.sendOTP(email: userEmail);
    print("my OTP result $result");
    if (result) {
      Get.snackbar("OTP Sent", "Please check your email");
    } else {
      Get.snackbar("Error", "Failed to send OTP");
    }
  }
// Khan@008  8726403478
  void verifyOtpOnCompleted(String pin) {
    bool isValid = EmailOTP.verifyOTP(otp: pin);
    if (isValid) {
      Get.snackbar("Success", "OTP Verified");
    } else {
      Get.snackbar("Error", "Invalid OTP");
    }
  }
}
