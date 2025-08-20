import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:forex_trade/app/modules/home/home_controller/home_controller.dart';
import 'package:forex_trade/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8.0),
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Column(
              children: [
                Text("Market", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  "Open",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.delete<HomeController>();
                  Get.to(HomeView());
                  //controller.typeSellBuy.value = !controller.typeSellBuy.value;
                },
                child: Text('data'),
              ),
              Obx(() {
                if (controller.positionItems.value == "") {
                  return Text("Fetching location...");
                }
                final latest = controller.positionItems.value;

                return Container(
                  width: Get.width / 2,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: Colors.blueGrey,
                        offset: Offset(-1, -1),
                      ),
                      BoxShadow(
                        blurRadius: 1,
                        color: Colors.blueGrey,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.pin_drop, color: Colors.red, size: 36),
                      // VerticalDivider(color: Colors.red),
                      // Spacer(),
                      Expanded(
                        child: Text(
                          "$latest",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                );
              }),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Obx(
                    () => stockDetails(context, controller.typeSellBuy.value),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget stockDetails(BuildContext context, type) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 1,
            color: Theme.of(context).dividerColor,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: Get.width / 3,
                child: Text(
                  "EURUSD", // sample long text
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  maxLines: 2, // max 2 line
                  softWrap: true, // allow wrap
                  overflow:
                      TextOverflow
                          .ellipsis, // agar 2 line ke baad aur text hai to ...
                ),
              ),
              Spacer(),
              Column(children: [Text("Open Price"), Text("164.98")]),
              SizedBox(width: MediaQuery.of(context).size.width / 12),
              Column(children: [Text("Current Price"), Text("164.98")]),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Column(children: [Text("Profit"), Text("2300")]),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (type == true) {
                    EasyLoading.showInfo("Sell is not Working");
                  } else {
                    EasyLoading.showInfo("Buy is not Working");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(
                    type == true ? 0xffed1c24 : 0xff99cc00,
                  ), // Button color
                  foregroundColor: Colors.white, // Text color
                  elevation: 2, // Shadow effect
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Rounded corners
                  ),
                ),
                child: Text(
                  type == true ? "Sell" : "Buy",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
          Text(controller.formattedTime.value),
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
  return IntrinsicHeight(
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

Widget _carouselSlider(BuildContext context) {
  final List<String> urls = [
    'https://png.pngtree.com/background/20210711/original/pngtree-financial-fashion-simple-stock-market-webpage-advertising-banner-background-picture-image_1168956.jpg', // replace with actual full URL from unsplash
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRM2CIyRBcMfAn9_QadqBB9dxgYXfhYrKWxPQ&s',
    'https://i.pinimg.com/736x/81/d1/e7/81d1e74bf75167affe7d989324f0cb1d.jpg',
  ];
  return CarouselSlider(
    options: CarouselOptions(
      height: MediaQuery.of(context).size.height / 7,
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,
      scrollDirection: Axis.horizontal,
    ),
    items:
        urls.map((src) {
          return Builder(
            builder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    src,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (ctx, err, st) => Container(
                          color: Colors.grey[200],
                          child: Icon(
                            Icons.broken_image,
                            size: 60,
                            color: Colors.red,
                          ),
                        ),
                  ),
                ),
              );
            },
          );
        }).toList(),
  );
}
