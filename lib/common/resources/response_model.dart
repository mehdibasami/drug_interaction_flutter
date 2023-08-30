class ResponseModel {
  bool isSuccess;
  String statusCode;
  String message;
  dynamic data;

  ResponseModel({
    this.isSuccess = false,
    this.statusCode = "",
    this.message = "",
    this.data,
  });

  ResponseModel fromJson(dynamic jsn) {
    statusCode = '${jsn["statusCode"] ?? jsn["StatusCode"]}';
    data = jsn["data"]??jsn;
    isSuccess = jsn["isSuccess"] ?? false;
    message = jsn["message"] ?? '${jsn["Message"]}';

    return this;
  }
}
