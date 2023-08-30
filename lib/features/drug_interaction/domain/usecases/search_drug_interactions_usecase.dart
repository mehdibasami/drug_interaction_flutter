import 'package:drug_interaction_detector/common/resources/response_state.dart';
import 'package:drug_interaction_detector/common/resources/use_case.dart';
import 'package:drug_interaction_detector/features/drug_interaction/domain/entities/drug_interaction_entity.dart';
import 'package:drug_interaction_detector/features/drug_interaction/domain/repository/drug_repository.dart';

class SearchDrugInteractionsUseCase
    implements
        UseCase<ResponseState<List<DrugInteractionEntity>>, List<String>> {
  final DrugRepository _drugRepository;
  SearchDrugInteractionsUseCase(this._drugRepository);

  @override
  Future<ResponseState<List<DrugInteractionEntity>>> call(List<String> params) {
    return _drugRepository.searchDrugInteractions(params);
  }
}
