import 'package:forex_trade/app/modules/dashboard/dashboard_controller/dashboard_controller.dart';
import 'package:forex_trade/app/modules/home/home_controller/home_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
Get.put<DashboardController>(DashboardController());
Get.put<HomeController>(HomeController());
  }
}