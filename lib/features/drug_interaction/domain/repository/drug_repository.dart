import 'package:drug_interaction_detector/common/resources/response_state.dart';
import 'package:drug_interaction_detector/features/drug_interaction/domain/entities/drug_entity.dart';
import 'package:drug_interaction_detector/features/drug_interaction/domain/entities/drug_interaction_entity.dart';

abstract class DrugRepository {
  Future<ResponseState<List<DrugEntity>>> searchDrugsByName(String name);

  Future<ResponseState<List<DrugInteractionEntity>>> searchDrugInteractions(
      List<String> drugs);
}
