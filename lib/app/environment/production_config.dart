import 'package:forex_trade/app/environment/base_config.dart';

class ProductionConfig implements BaseConfig{
  @override
  // TODO: implement baseApi
  String get baseApi => "https://forextrade-backend-2.onrender.com";
}