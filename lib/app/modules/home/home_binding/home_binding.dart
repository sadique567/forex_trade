import 'package:forex_trade/app/modules/home/home_controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    // Get.lazyPut(() => HomeController());
  }
}
