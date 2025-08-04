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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.05),
              //     blurRadius: 5,
              //     offset: const Offset(0, 2),
              //   ),
              // ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    onChanged: (value) {
                      controller.filterStock(value);
                    },
                    cursorColor: Colors.amber,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.search, color: Colors.grey),
              ],
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

Widget _searchBox(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(12),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.black.withOpacity(0.05),
      //     blurRadius: 5,
      //     offset: const Offset(0, 2),
      //   ),
      // ],
    ),
    child: Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
              isDense: true,
            ),
            onChanged: (value) {
              // controller
            },
            cursorColor: Colors.amber,
          ),
        ),
        const SizedBox(width: 10),

        const Icon(Icons.search, color: Colors.grey),
      ],
    ),
  );
}
