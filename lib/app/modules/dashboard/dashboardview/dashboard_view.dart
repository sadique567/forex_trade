import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forex_trade/app/modules/dashboard/dashboard_controller/dashboard_controller.dart';
import 'package:forex_trade/app/utils/Colors.dart';
import 'package:get/get.dart';

class DashboardView extends GetView<DashboardController> {
  void onItemTapped(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: App ,
      body: Obx(
        () => AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: controller.widgetOption[controller.selectedindex.value],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: MyColors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 3,
                offset: Offset(3, 0),
              ),
            ],
          ),
          child: ClipRRect(
            // borderRadius: BorderRadius.circular(12),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Theme.of(context).bottomAppBarTheme.color,
              currentIndex: controller.selectedindex.value,
              onTap: (index) {
                controller.selectedindex.value = index;
              },
              selectedItemColor: MyColors.blue,
              unselectedItemColor: MyColors.black,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              selectedFontSize: 12,
              unselectedFontSize: 10,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark),
                  activeIcon: Icon(Icons.bookmark_added),
                  label: "Watchlist",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notification_add_outlined),
                  activeIcon: Icon(Icons.notifications),
                  label: "Alert",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.wallet_outlined),
                  activeIcon: Icon(Icons.wallet),
                  label: "Funds",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
