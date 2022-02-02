import 'package:tracker_bloc/branche/entity/branch_entity.dart';
import 'package:tracker_bloc/branche/model/branch_model.dart';
import 'package:tracker_bloc/project/model/project_model.dart';

import '../dio.dart';

class BranchRepository {
  List<BranchModel> branches = [
    BranchModel(name: 'branches 1'),
    BranchModel(name: 'branches 1'),
    BranchModel(name: 'branches 1'),
    BranchModel(name: 'branches 1'),
  ];

  Future<List<BranchModel>> getBranchesByProjectId(int id) async {
    try {
      // var res = await dio.get('/projects/$id/repository/branches');
      // return res.data.map<BranchModel>((e) => BranchModel.fromEntity(BranchEntity.fromJson(e))).toList();
      return branches;
    } catch (e) {
      throw e;
    }
  }
}
