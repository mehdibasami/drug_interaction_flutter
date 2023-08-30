import 'package:dio/dio.dart';
import 'package:drug_interaction_detector/common/network/api_client.dart';

class DrugRemoteDataSource {
  Future<Response> searchDrugsByName(String name) async {
    final dio = ApiClient().dio();
    final responseModel = await dio
        .get('drug/searchDrugsByName', queryParameters: {'name': name});
    return responseModel;
  }

  Future<Response> searchDrugInteractions(List<String> drugs) async {
    final dio = ApiClient().dio();
    final responseModel = await dio
        .get('drug/searchDrugInteractions', queryParameters: {'drugs': drugs});
    return responseModel;
  }
}
