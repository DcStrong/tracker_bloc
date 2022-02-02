import 'package:tracker_bloc/project/entity/project_entity.dart';

import '../dio.dart';
import 'model/project_model.dart';

class ProjectRepository {
  List<Project> proj = [
    Project(id: 1, name: 'test1'),
    Project(id: 2, name: 'test2'),
    Project(id: 3, name: 'test3'),
    Project(id: 4, name: 'test4'),
    Project(id: 5, name: 'test5'),
    Project(id: 6, name: 'test6'),
  ];

  Future<List<Project>> getProjectList({String? searchParam}) async {
    try {
      var res = await dio.get('projects?search=${searchParam ?? ''}');
      return res.data
          .map<Project>((e) => Project.fromEntity(ProjectEntity.fromJson(e)))
          .toList();
      return proj;
    } catch (e) {
      throw e;
    }
  }
}
