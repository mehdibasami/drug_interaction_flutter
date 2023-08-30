import 'package:drug_interaction_detector/common/resources/request_status.dart';
import 'package:drug_interaction_detector/common/resources/response_state.dart';
import 'package:drug_interaction_detector/features/drug_interaction/domain/entities/drug_entity.dart';
import 'package:drug_interaction_detector/features/drug_interaction/domain/entities/drug_interaction_entity.dart';
import 'package:drug_interaction_detector/features/drug_interaction/domain/usecases/search_drug_interactions_usecase.dart';
import 'package:drug_interaction_detector/features/drug_interaction/domain/usecases/search_drugs_by_name_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugInteractionsController extends GetxController {
  DrugInteractionsController(
      this.searchDrugsByNameUseCase, this.searchDrugInteractionsUseCase);
  //usecases
  final SearchDrugsByNameUseCase searchDrugsByNameUseCase;
  final SearchDrugInteractionsUseCase searchDrugInteractionsUseCase;
  //api call states
  RequestStatus drugInteractionsRequestStatus = RequestStatus();
  RequestStatus searchDrugRequestStatus = RequestStatus();
  //fields
  List<DrugEntity> searchedDrugs = [];
  List<DrugEntity> selectedDrugs = [];
  List<DrugInteractionEntity> drugInteractions = [];
  TextEditingController drugNameTextEditController =
      TextEditingController(text: '');
  final searchDrugsFocusNode = FocusNode();

  void onChangeDrugNameInput(String value) {
    searchDrugByName(value);
  }

  searchDrugByName(String name) async {
    searchDrugRequestStatus.loading();
    update(['searchDrugByName']);

    ResponseState<List<DrugEntity>> responseState =
        await searchDrugsByNameUseCase(name);
    if (responseState is ResponseSuccess) {
      searchedDrugs = responseState.data!;
      searchDrugRequestStatus.success();

      update(['searchDrugByName']);
    } else if (responseState is ResponseFailed) {
      searchDrugRequestStatus.error('${responseState.error}');
    }
  }

  onTapDrug(DrugEntity drug) {
    selectedDrugs.addIf(!selectedDrugs.contains(drug), drug);
    searchDrugsFocusNode.unfocus();
    update(['selected_drugs']);
  }

  removeSelectedDrug(String drugId) {
    selectedDrugs.removeWhere((element) => element.id == drugId);
    update(['selected_drugs']);
  }

  searchDrugInteractions() async {
    drugInteractionsRequestStatus.loading();
    update(['get_interactions']);
    ResponseState<List<DrugInteractionEntity>> responseState =
        await searchDrugInteractionsUseCase(
            selectedDrugs.map((e) => e.name).toList());
    if (responseState is ResponseSuccess) {
      drugInteractionsRequestStatus.success();
      drugInteractions = responseState.data!;
      update(['get_interactions']);
    } else if (responseState is ResponseFailed) {
      drugInteractionsRequestStatus.error(responseState.error ?? '',
          showMessage: false);
      update(['get_interactions']);
    }
  }
}
