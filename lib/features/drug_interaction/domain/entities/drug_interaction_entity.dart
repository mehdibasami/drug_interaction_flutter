import 'package:drug_interaction_detector/features/drug_interaction/data/models/drug_model.dart';
import 'package:equatable/equatable.dart';

class DrugInteractionEntity extends Equatable {
  final String? id;
  final DrugModel? drug1;
  final DrugModel? drug2;
  final String? interactionType;
  final String interactionDescription;

  const DrugInteractionEntity({
    this.id,
    this.drug1,
    this.drug2,
    this.interactionDescription = '',
    this.interactionType,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}

