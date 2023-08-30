class Constants {
  static const bool isDevVersion = true;

  static const String apiBaseUrl = isDevVersion ? devApiUrl : productionApiUrl;
  static const String devApiUrl = 'http://de4.we-make.ir:8181/api/v1/';
  static const String productionApiUrl = 'http://de4.we-make.ir:8181/api/v1/';
}
