import 'dart:convert';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:forex_trade/app/API/api_import.dart';
import 'package:forex_trade/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:forex_trade/app/API/api_path.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {
  
  RxBool isVisible = true.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final userid = 0.obs;
  final message = "".obs;
  String url = "$baseApi_forexTrade$SIGNUP";

  final otpVerification = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    EmailOTP.config(
      appName: 'MyApp',
      otpType: OTPType.numeric,
      expiry: 4,
      emailTheme: EmailTheme.v1,
    );  
  }


  Future<void> sendOtp() async {
    final sent = await EmailOTP.sendOTP(email: emailController.text);
    if (sent) {
      EasyLoading.showToast('OTP sent to ${emailController.text}');
    } else {
      EasyLoading.showToast('Failed to send OTP');
    }
  }

  Future<void> verifyOtpAndSignup() async {
    final valid = EmailOTP.verifyOTP(otp: otpVerification.text);
    if (valid) {
      EasyLoading.showToast('OTP verified — signing up...');
      signUp();
    } else {
      EasyLoading.showToast('Invalid OTP, try again');
    }
  }


  @override
  void onClose() {
    super.onClose();
    fNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUp() async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json;charset=UTF-8",
        "accept": "application/json",
      },
      body: json.encode({
        "firstName": fNameController.text,
        "lastName": lNameController.text,
        "email": emailController.text,
        "age": int.parse(ageController.text),
        "gender": genderController.text,
        "password": passwordController.text,
      }),
    );
    var data = response.body.toString();
    if (response.statusCode == 200) {
      fNameController.clear();
      lNameController.clear();
      ageController.clear();
      genderController.clear();
      emailController.clear();
      ageController.clear();
      passwordController.clear();
      //    EasyLoading.showToast(data);
      Get.snackbar('${response.statusCode == 200}', data);
      Get.toNamed(AppRoutes.LOGIN_SCREEN);
    } else {
      EasyLoading.showToast(data);
    }
  }
}
