class CandleData {
  final DateTime date;
  final double open, high, low, close;

  CandleData(this.date, this.open, this.high, this.low, this.close);

  factory CandleData.fromJson(Map<String, dynamic> json) {
    return CandleData(
      DateTime.parse(json['date']),
      (json['open'] as num).toDouble(),
      (json['high'] as num).toDouble(),
      (json['low'] as num).toDouble(),
      (json['close'] as num).toDouble(),
    );
  }
}
