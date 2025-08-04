import 'package:flutter/material.dart';
import 'package:forex_trade/app/modules/alert_Notification/alert_view/alert_view.dart';
import 'package:forex_trade/app/modules/fund/fund_view/fund_view.dart';
import 'package:forex_trade/app/modules/home/home_view/home_view.dart';
import 'package:forex_trade/app/modules/watchList/watchlist_view/watchlist_views.dart';

import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedindex = 0.obs;

  final List<Widget> widgetOption = <Widget>[
    HomeView(),
    WatchlistViews(),
    FundView(),
    AlertView(),
  ];
}
