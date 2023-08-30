import 'package:drug_interaction_detector/features/drug_interaction/domain/entities/drug_entity.dart';

class DrugModel extends DrugEntity {
  const DrugModel({String? id, String name = '', String drugDescription = ''})
      : super(id: id, name: name, drugDescription: drugDescription);

  factory DrugModel.fromJson(Map<String, dynamic> json) {
    return DrugModel(
        id: json['_id'],
        name: json['name'] ?? "",
        drugDescription: json['drugDescription'] ?? '');
  }

   Map<String, dynamic> toJson() {
    return {
      'name': name,
      '_id': id,
      'drugDescription': drugDescription,
    };
  }
  static List<DrugModel> toList(dynamic json) {
    if (json != null) {
      return (json as List)
          .map((e) => DrugModel.fromJson(e))
          .toList();
    }
    return [];
  }
}
