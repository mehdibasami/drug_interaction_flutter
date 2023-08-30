import 'package:equatable/equatable.dart';

class DrugEntity extends Equatable {
  final String? id;
  final String name;
  final String drugDescription;

  const DrugEntity({
    this.id,
    this.name = '',
    this.drugDescription = '',
  });

  @override
  List<Object?> get props => [
        id,
        name,
        drugDescription,
      ];
}
