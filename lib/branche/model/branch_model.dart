import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tracker_bloc/branche/entity/branch_entity.dart';

@immutable
class BranchModel extends Equatable {
  final String name;

  BranchModel({
    required this.name,
  });

BranchModel copyWith() {
    return BranchModel(
      name: name,
    );
  }

  BranchEntity toEntity() {
    return BranchEntity(
      name: name,
    );
  }

  static BranchModel fromEntity(BranchEntity entity) {
    return BranchModel(
      name: entity.name,
    );
  }

  @override
  List<dynamic> get props => [name];
}