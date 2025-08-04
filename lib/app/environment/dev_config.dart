import 'package:forex_trade/app/environment/base_config.dart';

class DevConfig implements BaseConfig {
  @override
  String get baseApi => "https://forextrade-backend-2.onrender.com/";
}