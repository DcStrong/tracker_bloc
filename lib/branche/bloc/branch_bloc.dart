import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker_bloc/branche/branch_repository.dart';
import 'package:tracker_bloc/branche/model/branche.dart';

import 'branch_event.dart';
import 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  BranchBloc(BranchRepository branchRepository,)
  : _branchRepository = branchRepository,
  super(BranchEmpty()) {
    on<LoadingBranch>(_onLoadingBranch);
  }

  final BranchRepository _branchRepository;

  _onLoadingBranch(
    LoadingBranch event,
    Emitter<BranchState> emit
  ) {
    emit(BranchLoading());
    List<BrancheModel> branche = _branchRepository.getBranches();
    print(branche);
    return emit(BranchLoaded(branche));
  }
}