import 'package:drug_interaction_detector/common/resources/response_state.dart';
import 'package:drug_interaction_detector/common/resources/use_case.dart';
import 'package:drug_interaction_detector/features/drug_interaction/domain/entities/drug_entity.dart';
import 'package:drug_interaction_detector/features/drug_interaction/domain/repository/drug_repository.dart';

class SearchDrugsByNameUseCase
    implements UseCase<ResponseState<List<DrugEntity>>, String> {
  final DrugRepository _drugRepository;
  SearchDrugsByNameUseCase(this._drugRepository);

  @override
  Future<ResponseState<List<DrugEntity>>> call(String params) {
    return _drugRepository.searchDrugsByName(params);
  }
}
