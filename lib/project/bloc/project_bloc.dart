import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker_bloc/branche/branch_repository.dart';
import 'package:tracker_bloc/branche/model/branch_model.dart';
import 'package:tracker_bloc/helper/shared_preferences.dart';
import 'package:tracker_bloc/project/bloc/project_event.dart';
import 'package:tracker_bloc/project/bloc/project_state.dart';
import 'package:tracker_bloc/project/entity/project_entity.dart';
import 'package:tracker_bloc/project/model/project_model.dart';

import '../project_repository.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc(
    ProjectRepository projectsRepository,
    BranchRepository branchRepository,
    SharedPreferencess sharedPreferencess,
  )   : _projectsRepository = projectsRepository,
        _branchRepository = branchRepository,
        _sharedPreferencess = sharedPreferencess,
        super(ProjectEmpty()) {
    on<LoadingProject>(_onLoadedProjects);
    on<UpdatedProject>(_onUpdatedProject);
    on<LoadingBranch>(_onLoadingBranche);
  }

  final ProjectRepository _projectsRepository;
  final BranchRepository _branchRepository;
  final SharedPreferencess _sharedPreferencess;

  void _onLoadedProjects(
      LoadingProject event, Emitter<ProjectState> emit) async {
    List<Project> projects = [];
    projects = await _sharedPreferencess.getJsonByKey('PROJECT_KEY');

    if (projects.length < 0) {
      projects = await _projectsRepository.getProjectList();
      _saveProjectFromLocalStorage(projects);
    }

    if (projects.length < 0) {
      return emit(ProjectEmpty());
    }
    return emit(ProjectLoaded(projects));
  }

  void _onLoadingBranche(
      LoadingBranch event, Emitter<ProjectState> emit) async {
    List<BranchModel> branche =
        await _branchRepository.getBranchesByProjectId(event.project.id);
    final project = event.project.copyWith(brances: branche);
    _onUpdated(project, emit);
  }

  void _onUpdatedProject(UpdatedProject event, Emitter<ProjectState> emit) {
    _onUpdated(event.project, emit);
  }

  void _onUpdated(Project project, Emitter<ProjectState> emit) {
    final state = this.state;
    if (state is ProjectLoaded) {
      final projectList = state.projects;
      final List<Project> updatedProject = projectList.map<Project>((e) {
        return e.id == project.id ? project : e;
      }).toList();
      _saveProjectFromLocalStorage(updatedProject);
      return emit(ProjectLoaded(updatedProject));
    }
  }

  _saveProjectFromLocalStorage(List<Project> projects) async {
    await _sharedPreferencess.saveListObjByKey('PROJECT_KEY', projects);
  }
}
