import 'package:equatable/equatable.dart';
import 'package:tracker_bloc/branche/model/branch_model.dart';

class BranchEntity extends Equatable {
  final String name;

  const BranchEntity({
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }

  @override
  List<Object?> get props => List<Object?>.from(toJson().values);

  static BranchEntity fromJson(Map<String, dynamic> json) {
    return BranchEntity(
      name: json['name'] as String,
    );
  }
}