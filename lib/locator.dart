import 'package:drug_interaction_detector/features/drug_interaction/data/datasource/remote_datasource.dart';
import 'package:drug_interaction_detector/features/drug_interaction/data/repository/drug_repository_impl.dart';
import 'package:drug_interaction_detector/features/drug_interaction/domain/repository/drug_repository.dart';
import 'package:drug_interaction_detector/features/drug_interaction/domain/usecases/search_drug_interactions_usecase.dart';
import 'package:drug_interaction_detector/features/drug_interaction/domain/usecases/search_drugs_by_name_usecase.dart';
import 'package:get/get.dart';

initLocator() async {
  //* app database

  //* data source
  Get.lazyPut<DrugRemoteDataSource>(() => DrugRemoteDataSource());

  //* repository
  Get.lazyPut<DrugRepository>(() => DrugRepositoryImpl(Get.find()));

  //* usecase
  Get.lazyPut<SearchDrugInteractionsUseCase>(
      () => SearchDrugInteractionsUseCase(Get.find()));
  Get.lazyPut<SearchDrugsByNameUseCase>(
      () => SearchDrugsByNameUseCase(Get.find()));

  //* presntation
}
