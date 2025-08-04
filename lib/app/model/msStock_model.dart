class StockModel {
  final String stockName;
  final String stockCurentPrice;
  final String exchageType;
  final String todayProfitLoss;
  final bool isUp;

  StockModel({
    required this.stockName,
    required this.stockCurentPrice,
    required this.exchageType,
    required this.todayProfitLoss,
    required this.isUp,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      stockName: json['stockName'],
      stockCurentPrice: json['stockCurentPrice'],
      exchageType: json['exchageType'],
      todayProfitLoss: json['todayProfitLoss'],
      isUp: json['isUp'],
    );
  }
}
