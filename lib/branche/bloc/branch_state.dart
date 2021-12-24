import 'package:equatable/equatable.dart';
import 'package:tracker_bloc/branche/model/branche.dart';

abstract class BranchState extends Equatable {
  const BranchState();

  @override
  List<Object> get props => [];
}

class BranchEmpty extends BranchState {}

class BranchLoaded extends BranchState {
  final List<BrancheModel> branche;

  const BranchLoaded([this.branche = const []]);

  @override
  List<Object> get props => [];
}

class BranchLoading extends BranchState {}