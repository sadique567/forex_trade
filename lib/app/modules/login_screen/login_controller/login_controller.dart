import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:forex_trade/app/API/api_import.dart';
import 'package:forex_trade/app/data/storage.dart';
import 'package:forex_trade/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:forex_trade/app/API/api_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  ApiImport apiImport = ApiImport();

  SharedPreferences prefs = Get.find<SharedPreferences>();

  RxBool isVisible = true.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userid = 0.obs;
  final message = "".obs;
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  final islogin = false.obs;
  String url = "$baseApi_forexTrade$LOGIN";

  void submit() async {
    if (formKeyLogin.currentState!.validate()) {
      // login();
      print("Email: ${emailController.text}");
      print("Password: ${passwordController.text}");
      // Get.toNamed(AppRoutes.DASHBOARD_SCREEN);
      print("Lofing Url: $url");
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json;charset=UTF-8",
          "accept": "application/json",
        },
        body: json.encode({
          "email": emailController.text,
          "password": passwordController.text,
        }),
      );
      var data = response.body.toString();
      if (response.statusCode == 200) {
        //    EasyLoading.showToast(data);
        Get.snackbar('${response.statusCode == 200}', data);
        prefs.setString(MyStorage.email, emailController.text);
        prefs.setString(MyStorage.password, passwordController.text);
        prefs.setBool(MyStorage.isLogedin, true);
        // islogin.value =  prefs.getBool(storage.isLogedin) ?? false;
        Get.toNamed(AppRoutes.DASHBOARD_SCREEN);
      } else {
        EasyLoading.showToast(data);
      }
    }
  }


  // Future<void> loginaMethod() async {
  //   Map body = {
  //     "email": emailController.text,
  //     "password": passwordController.text,
  //   };
  //   ApiResponse apiResponse = await apiImport.loginApi(body);
  //   print("login Con: $apiResponse");
  //   if (apiResponse.status) {
  //     // CommonResponse response=apiResponse.data;
  //     // Get.snackbar(response.status.toString(),response. message);
  //     EasyLoading.showToast('hehehhe');
  //     Get.toNamed(AppRoutes.DASHBOARD_SCREEN);
  //   }
  // }

  // Future<void> loginMethod() async {
  //   Map body = {"email": emailController.text};
  //   MyApiResponse response = await apiImport.loginApi(body);
  //   if (response.statuscode) {
  //     Get.snackbar(response.data["status"], response.data["message"]);
  //     print(response.data["userId"]);
  //     getProfile(id: response.data["userId"]);
  //   } else {
  //     Get.snackbar("error", response.message);
  //   }
  // }

  // Future<void> login() async {
  //   try {
  //     Map<String, String> headers = {
  //       "Content-Type": "application/json",
  //       "Accept": "application/json",
  //     };
  //     var response = await http.post(
  //       Uri.parse("http://deenfit-001-site1.qtempurl.com/api/Account/login"),
  //       body: json.encode({"email": emailController.text}),
  //       headers: headers,
  //     );
  //     Map data = json.decode(response.body);
  //     if (response.statusCode == 200) {
  //       print(data["status"]);
  //       print(data["message"]);
  //       print(data["userId"]);
  //       getProfile(id: data["userId"]);
  //     } else {
  //       print('Fail');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> getProfile({int? id}) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   try {
  //     var response = await http.get(
  //       Uri.parse(
  //         "http://deenfit-001-site1.qtempurl.com/api/Account/profile/$id",
  //       ),
  //       headers: {"Content-Type": "application/json"},
  //     );
  //     Map data = json.decode(response.body);

  //     if (response.statusCode == 200) {
  //       String jsonString = jsonEncode(data);
  //       await prefs.setString('profileData', jsonString);
  //       print(data["fullName"]);
  //       print(data["email"]);
  //       print(data["createdAt"]);

  //       await Get.toNamed(AppRoutes.HOME_SCREEN);
  //     } else {
  //       print("Jhant nai kuch aava");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
