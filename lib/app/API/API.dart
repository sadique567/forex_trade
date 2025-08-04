import 'package:forex_trade/app/API/base_api.dart';
abstract class Api {

  Future<ApiResponse> loginApi(Map body);
  Future<ApiResponse> getUserDetails(Map body);
}