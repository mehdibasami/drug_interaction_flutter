import 'package:drug_interaction_detector/common/network/custom_interceptor.dart';
import 'package:drug_interaction_detector/configs/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart' as dio_package;

// abstract class ApiClientContract {
//   Future<ResponseModel> get({
//     required String url,
//     Map<String, dynamic> queries = const {},
//   });
//   Future<ResponseModel> post({
//     required String url,
//     dynamic body,
//     Map<String, dynamic> queries = const {},
//   });
//   Future<ResponseModel> delete({
//     required String url,
//     Object? body,
//     Map<String, dynamic> queries = const {},
//   });
// }

class ApiClient {
  static final ApiClient _converter = ApiClient._internal();

  factory ApiClient() {
    return _converter;
  }

  ApiClient._internal();

  dio_package.Dio dio({bool needAuth = true}) {
    var dio = dio_package.Dio(
      dio_package.BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        // receiveTimeout: ,
        baseUrl: Constants.apiBaseUrl,
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(dio_package.LogInterceptor(
        request: true,
        error: true,
        requestHeader: true,
        responseBody: true,
      ));
    }

    dio.interceptors.add(CustomInterceptor(needAuth: needAuth));

    return dio;
  }
}
