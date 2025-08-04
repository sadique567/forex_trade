import 'package:flutter/material.dart';
import 'package:forex_trade/app/utils/Colors.dart';

class MyAppName extends StatelessWidget {
  const MyAppName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.green.withOpacity(0.5),
      body: Center(child: AppName()),
    );
  }
}

Widget AppName() {
  final double fontSize_Login = 34;
  return RichText(
    text: TextSpan(
      text: "FOREX",
      style: TextStyle(
        fontSize: fontSize_Login,
        fontWeight: FontWeight.bold,
        color: MyColors.black,
      ),
      children: <TextSpan>[
        TextSpan(
          text: " TRADE",
          style: TextStyle(
            color: MyColors.primaryColor,
            fontSize: fontSize_Login,
          ),
        ),
      ],
    ),
  );
}
