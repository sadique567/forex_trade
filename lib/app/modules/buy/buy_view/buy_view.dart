import 'package:flutter/material.dart';
import 'package:forex_trade/app/model/candelModeldata.dart';
import 'package:forex_trade/app/modules/buy/buy_controller/buy_controller.dart';
import 'package:forex_trade/app/utils/Colors.dart';
import 'package:forex_trade/app/utils/common_widget.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BuyView extends GetView<BuyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stock name")),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              TabBar(
                //   indicator: BoxDecoration(
                //     color: MyColors.blue,
                //     borderRadius: BorderRadius.circular(12),
                //   ),
                labelColor: Theme.of(context).tabBarTheme.labelColor,

                indicatorSize: TabBarIndicatorSize.tab,

                dividerColor: Theme.of(context).dividerColor,
                tabs: [
                  Tab(text: "Summary"),
                  Tab(text: "Chart"),
                  Tab(text: "Fundamental"),
                ],
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text("Tab 1 content")),
                    Center(child: TradingChartView() , ),
                    Center(child: Text("Tab 3 content")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TradingChartView extends StatelessWidget {
  final ChartController controller = Get.put(ChartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            return Flexible(
              child: SfCartesianChart(
                // title: ChartTitle(text: 'Stock Candle Chart'),
                primaryXAxis: DateTimeAxis(),
                primaryYAxis: NumericAxis(opposedPosition: true),
                tooltipBehavior: TooltipBehavior(enable: true),
                zoomPanBehavior: ZoomPanBehavior(
                  enablePanning: true,
                  enablePinching: true,
                ),
                trackballBehavior: TrackballBehavior(
                  enable: true,
                  activationMode: ActivationMode.singleTap,
                ),
                series: <CandleSeries>[
                  CandleSeries<CandleData, DateTime>(
                    dataSource: controller.candles,
                    xValueMapper: (c, _) => c.date,
                    lowValueMapper: (c, _) => c.low,
                    highValueMapper: (c, _) => c.high,
                    openValueMapper: (c, _) => c.open,
                    closeValueMapper: (c, _) => c.close,
                    bearColor: Colors.red,
                    bullColor: Colors.green,
                  ),
                ],
              ),
            );
          }),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
            child: buySell(context),
          ),
        ],
      ),
    );
  }
}
