import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forex_trade/app/utils/button_widget.dart';
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

Widget buySell(BuildContext context, {VoidCallback? onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      MyButton(
        buttonName: "Buy",
        borderRadius: 35,
        fontSize: 16,
        width: MediaQuery.sizeOf(context).width / 4,
        backgroundColor: Colors.teal[700],
        height: MediaQuery.sizeOf(context).width / 12,
        borderColor: Colors.transparent,

        onTap: () {},
      ),
      SizedBox(width: MediaQuery.sizeOf(context).width / 15),
      MyButton(
        buttonName: "Sell",
        borderRadius: 35,
        fontSize: 16,
        width: MediaQuery.sizeOf(context).width / 4,
        backgroundColor: Colors.red,
        height: MediaQuery.sizeOf(context).width / 12,
        borderColor: Colors.transparent,
        onTap: () {},
      ),
    ],
  );
}
