 import 'package:forex_trade/app/modules/buy/buy_controller/buy_controller.dart';
import 'package:get/get.dart';

class BuyBinding extends Bindings{
  @override
  void dependencies() {
 Get.put<BuyController>(BuyController());
  }
}