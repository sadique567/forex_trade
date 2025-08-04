import 'package:flutter/material.dart';
import 'package:forex_trade/app/modules/alert_Notification/alert_controller/alert_controller.dart';
import 'package:get/get.dart';

class AlertView extends GetView <AlertController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Center(child: Text("There are no alert yet"))]),
    );
  }
}
