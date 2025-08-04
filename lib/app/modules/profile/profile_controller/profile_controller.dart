import 'dart:convert';
import 'package:forex_trade/app/data/storage.dart';
import 'package:forex_trade/app/theme/MyThemeController.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  final SharedPreferences prefs = Get.find<SharedPreferences>();
  final mythemecontroller = Get.put<Mythemecontroller>(Mythemecontroller());
  //Theme Data

  Future<void> getUserDetails() async {
    print("Name : ${prefs.getString(MyStorage.email)}");
    print("Password : ${prefs.getString(MyStorage.password)}");

    Map body = {
      "email": prefs.getString(MyStorage.email),
      "password": prefs.getString(MyStorage.password),
    };
    try {
      var response = await http.get(
        Uri.parse("https://forextrade-backend-2.onrender.com/user"),
        headers: {
          "Content-Type": "application/json;charset=UTF-8",
          "accept": "application/json",
        },
      );
      // Map data = json.decode(response.body);
      if (response.statusCode == 200) {
        Map data = json.decode(response.body);
        print("ID: ${data["_id"]}");
        print("First Name: ${data["firstName"]}");
        // print("Last Name: ${data[0]["lastName"]}");
        // print("Email: ${data[0]["email"]}");
        // print("About: ${data[0]["about"]}");
      } else {
        print("failed");
      }
    } catch (err) {
      print("Error : $err");
    }
  }
}
