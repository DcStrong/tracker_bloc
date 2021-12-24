import 'package:tracker_bloc/branche/model/branche.dart';

class BranchRepository {
  List<BrancheModel> getBranches() {
    List<BrancheModel> branches = [
      BrancheModel(
        name: 'branches 1'
      ),
      BrancheModel(
        name: 'branches 1'
      ),
      BrancheModel(
        name: 'branches 1'
      ),
      BrancheModel(
        name: 'branches 1'
      ),
    ];

    return branches;
  }
}