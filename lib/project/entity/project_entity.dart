import 'package:equatable/equatable.dart';
import 'package:tracker_bloc/branche/entity/branch_entity.dart';
import 'package:tracker_bloc/branche/model/branch_model.dart';

class ProjectEntity extends Equatable {
  final int id;
  final String name;
  final List<BranchModel>? branchs;

  const ProjectEntity({
    required this.id,
    required this.name,
    this.branchs,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'branchs': branchs?.map((e) => e.toEntity().toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => List<Object?>.from(toJson().values);

  static ProjectEntity fromJson(Map<String, dynamic> json) {
    return ProjectEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      branchs: json['branchs'] != null
          ? _branchsFromJson(json['branchs'])
          : json['branchs'],
    );
  }

  static List<BranchModel> _branchsFromJson(List branches) {
    return branches
        .map((e) => BranchModel.fromEntity(BranchEntity.fromJson(e)))
        .toList();
  }
}
