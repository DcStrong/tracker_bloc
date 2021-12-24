import 'package:tracker_bloc/project/entity/project_entity.dart';

import '../dio.dart';
import 'model/project_model.dart';

class ProjectRepository {
  Future<List<Project>> getProjectList({String? searchParam}) async {
    try {
      var res = await dio.get('projects?search=$searchParam');
      return res.data.map<Project>((e) => Project.fromEntity(ProjectEntity.fromJson(e))).toList();
    } catch (e) {
      throw e;
    }
  }
}