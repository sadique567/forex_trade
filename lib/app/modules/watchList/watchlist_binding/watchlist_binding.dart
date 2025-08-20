import 'package:forex_trade/app/modules/watchList/watchlist_controller/watchlist_controller.dart';
import 'package:get/get.dart';

class WatchlistBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WatchlistController>(WatchlistController());
  }
}
