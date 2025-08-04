import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:forex_trade/app/modules/fund/fund_controller/func_controller.dart';
import 'package:forex_trade/app/utils/Colors.dart';
import 'package:forex_trade/app/utils/common_widget.dart';
import 'package:get/get.dart';

class FundView extends GetView<FundController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: myHeadingText(text: "Funds"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            // decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Total Cash",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("All Segment", style: TextStyle(fontSize: 12)),
                  trailing: Text(
                    "13361.77",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  title: Text(
                    "Available Trade",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  trailing: Text(
                    "13361.77",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ),

                ListTile(
                  title: Text(
                    "Margin used",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  trailing: Text(
                    "13361.77",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Available to withdraw",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  trailing: Text(
                    "13361.77",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 6),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(
                        color: Theme.of(context).shadowColor,
                        width: 1,
                      ),
                    ),
                  ),

                  child: Text(
                    "Withdraw Funds",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                Spacer(),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 6),

                    // custom blue color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(
                        color: Theme.of(context).shadowColor,
                        width: 1,
                      ),
                    ),
                  ),

                  child: Text(
                    "Add Funds",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
