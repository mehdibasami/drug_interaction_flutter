import 'package:drug_interaction_detector/features/drug_interaction/data/models/drug_model.dart';
import 'package:drug_interaction_detector/features/drug_interaction/domain/entities/drug_interaction_entity.dart';

class DrugInteractionModel extends DrugInteractionEntity {
  const DrugInteractionModel(
      {String? id,
      DrugModel? drug1,
      DrugModel? drug2,
      String interactionDescription = '',
      String? interactionType})
      : super(
            id: id,
            drug1: drug1,
            drug2: drug2,
            interactionDescription: interactionDescription,
            interactionType: interactionType);

  factory DrugInteractionModel.fromJson(Map<String, dynamic> json) {
    return DrugInteractionModel(
        id: json['_id'],
        drug1: DrugModel.fromJson(json['drug1']),
        drug2: DrugModel.fromJson(json['drug2']),
        interactionDescription: json['interactionDescription'],
        interactionType: json['interactionType']);
  }
  static List<DrugInteractionModel> toList(dynamic json) {
    if (json != null) {
      List<DrugInteractionModel> list =
          (json as List).map((e) => DrugInteractionModel.fromJson(e)).toList();
      return list;
    }
    return [];
  }
}
