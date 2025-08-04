import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Widget appBg({Widget? child}) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("asset/image/logo.png")),
      ),
      child: child,
    ),
  );
}

Widget myHeadingText({String? text}) {
  return Text(
    text ?? "",
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  );
}

Widget myBackButton() {
  return InkWell(
    onTap: () => Get.back(),
    child: Icon(Icons.arrow_back_ios_new),
  );
}
