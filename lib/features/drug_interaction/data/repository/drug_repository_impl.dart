import 'package:dio/dio.dart';
import 'package:drug_interaction_detector/common/resources/response_state.dart';
import 'package:drug_interaction_detector/features/drug_interaction/data/datasource/remote_datasource.dart';
import 'package:drug_interaction_detector/features/drug_interaction/data/models/drug_interaction_model.dart';
import 'package:drug_interaction_detector/features/drug_interaction/data/models/drug_model.dart';
import 'package:drug_interaction_detector/features/drug_interaction/domain/entities/drug_entity.dart';
import 'package:drug_interaction_detector/features/drug_interaction/domain/entities/drug_interaction_entity.dart';
import 'package:drug_interaction_detector/features/drug_interaction/domain/repository/drug_repository.dart';

class DrugRepositoryImpl implements DrugRepository {
  final DrugRemoteDataSource dataSource;

  DrugRepositoryImpl(this.dataSource);
  @override
  Future<ResponseState<List<DrugInteractionEntity>>> searchDrugInteractions(
      List<String> drugs) async {
    try {
      final Response response = await dataSource.searchDrugInteractions(drugs);
      if (response.statusCode == 200) {
        List<DrugInteractionEntity> interactions =
            DrugInteractionModel.toList(response.data['data']);
        return ResponseSuccess(interactions);
      } else {
        return ResponseFailed(response.statusMessage ?? '');
      }
    } catch (e) {
      return ResponseFailed(e.toString());
    }
  }

  @override
  Future<ResponseState<List<DrugEntity>>> searchDrugsByName(String name) async {
    try {
      final Response response = await dataSource.searchDrugsByName(name);
      if (response.statusCode == 200) {
        List<DrugEntity> drugs = DrugModel.toList(response.data['data']);
        return ResponseSuccess(drugs);
      } else {
        return ResponseFailed(response.statusMessage ?? '');
      }
    } catch (e) {
      return ResponseFailed(e.toString());
    }
  }
}
