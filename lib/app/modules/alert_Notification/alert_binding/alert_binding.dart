import 'package:forex_trade/app/modules/alert_Notification/alert_controller/alert_controller.dart';
import 'package:get/get.dart';

class AlertBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AlertController>(AlertController());
  }
}
