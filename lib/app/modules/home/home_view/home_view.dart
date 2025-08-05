import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:forex_trade/app/modules/home/home_controller/home_controller.dart';
import 'package:forex_trade/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).dialogBackgroundColor,

        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => Get.toNamed(AppRoutes.PROFILE_SCREEN),
            child: CircleAvatar(
              backgroundImage: AssetImage("asset/image/user.jpg"),
            ),
          ),
        ),
        title: Text("Forex Trade"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 1,
                  offset: const Offset(1, 1),
                ),
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 1,
                  offset: const Offset(-1, -1),
                ),
              ],
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                controller.filterStock(value);
              },
              cursorColor: Colors.amber,
            ),
          ),

          Expanded(
            child: Obx(() {
              if (controller.filterStockList.isEmpty) {
                return Center(child: Text("No Stock Found........"));
              }

              return ListView(
                children: [
                  _Exchanger(context),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _myButton(context, "Tranding", () {}),
                        _myButton(context, "FX", () {}),
                        _myButton(context, "Fx Metals", () {}),
                      ],
                    ),
                  ),

                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.filterStockList.length,
                    itemBuilder: (context, index) {
                      final stock = controller.filterStockList[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.BUY_SCREEN);
                        },
                        child: _stockList(
                          context: context,
                          stockName: stock.stockName,
                          stockCurentPrice: stock.stockCurentPrice,
                          exchageType: stock.exchageType,
                          todayProfitLoss: stock.todayProfitLoss,
                          isUp: stock.isUp,
                        ),
                      );
                    },
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

Widget _stockList({
  required BuildContext context,
  String? stockName,
  String? stockCurentPrice,
  String? exchageType,
  String? todayProfitLoss,
  bool isUp = true,
}) {
  return Column(
    children: [
      Divider(height: 1),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Icon(
              Icons.trending_up_rounded,
              color: isUp ? Colors.green : Colors.red,
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  stockName ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(exchageType ?? ''),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  stockCurentPrice ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isUp ? Colors.green : Colors.red,
                  ),
                ),
                Text(todayProfitLoss ?? ''),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _Exchanger(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("NIFTY 50", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("7%"),
            ],
          ),
          VerticalDivider(
            color: Theme.of(context).highlightColor,
            thickness: 1.5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("SENSEX", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("14%"),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _myButton(BuildContext context, String text, VoidCallback onTap) {
  return Container(
    width: MediaQuery.sizeOf(context).width / 4,
    height: MediaQuery.sizeOf(context).width / 7.5,
    // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(15),
      // border: Border.all(width: 1, color: Colors.black),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).hintColor,
          blurRadius: 1,
          spreadRadius: 0.5,
          offset: Offset(-2, -2),
        ),
        BoxShadow(
          color: Theme.of(context).hintColor,
          blurRadius: 1,
          spreadRadius: 0.5,
          offset: Offset(2, 2),
        ),
      ],
    ),
    child: Center(
      child: Text(
        text ?? "",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
