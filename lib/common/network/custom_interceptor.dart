import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drug_interaction_detector/common/utils/custom_message_bar.dart';

class CustomInterceptor extends Interceptor {
  final bool needAuth;

  CustomInterceptor({required this.needAuth});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Load token and pass to the header
    if (needAuth) {
      options.headers
          .addAll({HttpHeaders.authorizationHeader: "bearer api_token"});
    }
    return handler.next(options);
  }

  // You can also perform some actions in the response or onError.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.connectionTimeout) {
      //Get.snackbar("API Error", "Connection Timeout Exception");
      CustomMessageBar.makeSnackBar(
          message: "Connection Timeout Exception",
          title: "Connection Error",
          type: SnackType.error);
    } else {
      CustomMessageBar.makeSnackBar(
          message: err.response?.data['error'] ?? err.message ?? 'Unknown',
          title:
              "API Error ${err.response?.data ?? err.response?.statusMessage ?? ""}",
          type: SnackType.error);
    }
    return handler.next(err);
  }
}
