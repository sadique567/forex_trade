import 'package:forex_trade/app/API/API.dart';
import 'package:forex_trade/app/API/api_path.dart';
import 'package:forex_trade/app/API/base_api.dart';
import 'package:forex_trade/app/environment/environment.dart';

final String baseApi_forexTrade = Environment().baseConfig.baseApi;

class ApiImport extends Api {
  @override
  Future<ApiResponse> loginApi(Map body) async {
    ApiResponse apiResponse = await commonPostApi(
      baseApi_forexTrade,
      LOGIN,
      body,
    );
    if (apiResponse.status) {
      //CommonResponse response = commonResponseFromJson(apiResponse.data);

      return ApiResponse.success(apiResponse.status);
    } else {
      return ApiResponse.failed(apiResponse.message);
    }
  }

  @override
  Future<ApiResponse> getUserDetails(Map body) async {
    ApiResponse apiResponse = await getRequestApi(
      baseApi_forexTrade,
      USER_DETAILS,
      body,
    );
    if (apiResponse.status) {
      return ApiResponse.success(apiResponse.status);
    } else {
      return ApiResponse.failed(apiResponse.message);
    }
  }
}
