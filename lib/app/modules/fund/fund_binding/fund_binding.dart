import 'package:forex_trade/app/modules/fund/fund_controller/func_controller.dart';
import 'package:get/get.dart';

class FundBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FundController>(FundController());
  }
}
