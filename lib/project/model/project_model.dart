import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tracker_bloc/branche/model/branche.dart';
import 'package:tracker_bloc/project/entity/project_entity.dart';

@immutable
class Project extends Equatable {
  final int id;
  final String name;
  final List<BrancheModel>? brances;
  bool? loadingBranches;

  Project({
    required this.id,
    required this.name,
    this.loadingBranches = false,
    List<BrancheModel>? brances,
  }) : this.brances = brances ?? null;

  Project copyWith({List<BrancheModel>? brances, bool? loadingBranches}) {
    return Project(
      id: id,
      name: name,
      loadingBranches: loadingBranches ?? this.loadingBranches,
      brances: brances ?? this.brances,
    );
  }

  ProjectEntity toEntity() {
    return ProjectEntity(
      id: id,
      name: name,
      branchs: brances,
    );
  }

  static Project fromEntity(ProjectEntity entity) {
    return Project(
      id: entity.id,
      name: entity.name,
      brances: entity.branchs,
    );
  }

  @override
  List<dynamic> get props => [name, id, brances, loadingBranches];
}