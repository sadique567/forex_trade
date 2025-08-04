import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:forex_trade/app/model/msStock_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var stockList = <StockModel>[].obs;
  var filterStockList = <StockModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStockData();
  }

  Future<void> fetchStockData() async {
    final String response = await rootBundle.loadString(
      'asset/stocks_mock_data.json',
    );
    final List<dynamic> data = json.decode(response);
    stockList.value = data.map((json) => StockModel.fromJson(json)).toList();
    filterStockList.value =
        data.map((json) => StockModel.fromJson(json)).toList();
  }

  void filterStock(String stock) {
    if (stock.isEmpty) {
      filterStockList.value = stockList;
    } else {
      
      filterStockList.value =
          stockList
              .where(    
                (item) =>
                    item.stockName.toLowerCase().contains(stock.toLowerCase()),
              )
              .toList();
    }
  }
}
