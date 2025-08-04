import 'package:flutter/material.dart';
import 'package:forex_trade/app/modules/watchList/watchlist_controller/watchlist_controller.dart';
import 'package:get/get.dart';

class WatchlistViews extends GetView<WatchlistController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Center(child: Text("Watch Lsit"))]),
    );
  }
}
