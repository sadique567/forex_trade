import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:forex_trade/app/model/commonResponse.dart';
import 'package:http/http.dart' as http;

var timeoutDuration = 90;
String userPassword = '';
Map<String, String> headers = {
  "Content-Type": "application/json;charset=UTF-8",
  "accept": "application/json",
  "Access-Control-Allow-Origin": "*",
  'Charset': 'utf-8',
};

/*
UserResponse? userInfo;
UserProfileResponse? userProfile;
LoginResponse? tokenInfo;

*/

Future<ApiResponse> getRequestApi(base, method , body) async {
  try {
    String url = '$base/$method';
    print('Get => $url');
    final response = await getRequest(url , body);
    ApiResponse apiResponse = responseFilter(response);
    if (apiResponse.status) {
      return ApiResponse(
        status: true,
        data: apiResponse.data,
        message: SUCCESS,
      );
    } else {
      return apiResponse;
    }
  } catch (e) {
    return ApiResponse(status: false, data: null, message: e.toString());
  }
}
Future<http.Response> getRequest(url , body) async {
  if (kDebugMode) {
    print(url);
  }

  final response = await http
      .get(Uri.parse(url), headers: headers)
      .timeout(
        Duration(seconds: timeoutDuration),
        onTimeout: () {
          return http.Response('Request time out', 408);
        },
      );
  return response;
}


Future<ApiResponse> commonPostApi(base, method, body) async {
  try {
    String url = '$base$method';
    final response = await postRequest(url, body);
    ApiResponse apiResponse = responseFilter(response);
    if (apiResponse.status) {
      CommonResponse response = commonResponseFromJson(apiResponse.data);
      return ApiResponse(status: true, data: response, message: SUCCESS);
    } else {
      return apiResponse;
    }
  } catch (err) {
    return ApiResponse(message: err.toString(), status: false, data: null);
  }
}

ApiResponse responseFilter(http.Response response) {
  try {
    switch (response.statusCode) {
      case 200:
        var data = jsonDecode(response.body);
        if (data is Map) {
          Map map = jsonDecode(response.body);
          if (map["status"] == "failed") {
            if (map['message'] != null) {
              if (map['message'].toString().toLowerCase().contains('expire')) {}
            }
            return ApiResponse(
              message: map['message'],
              status: false,
              data: response.body,
            );
          }
        }
        return ApiResponse(message: SUCCESS, status: true, data: response.body);
      case 400:
        return ApiResponse(
          status: false,
          data: response.body,
          message: 'Bad Request',
        );
      case 404:
        return ApiResponse(
          status: false,
          data: response.body,
          message: 'Not Found',
        );
      case 408:
        return ApiResponse(
          status: false,
          data: response.body,
          message: 'Request Timeout',
        );
      default:
        return ApiResponse(status: false, data: response.body, message: ERROR);
    }
  } catch (err) {
    return ApiResponse(message: err.toString(), status: false, data: null);
  }
}

Future<http.Response> postRequest(url, body, {loading = true}) async {
  final response = await http
      .post(Uri.parse(url), body: json.encode(body), headers: headers)
      .timeout(
        Duration(seconds: timeoutDuration),
        onTimeout: () {
          return http.Response("Error", 408);
        },
      );
  EasyLoading.dismiss();
  return response;
}

const String SUCCESS = "success";
const String ERROR = "Failure";
class ApiResponse {
  String message;
  dynamic data;
  bool status;

  ApiResponse({
    required this.message,
    required this.status,
    required this.data,
  });
  factory ApiResponse.success(data) {
    return ApiResponse(message: "", status: true, data: data);
  }
  factory ApiResponse.failed(message) {
    return ApiResponse(message: message, status: false, data: null);
  }
}



