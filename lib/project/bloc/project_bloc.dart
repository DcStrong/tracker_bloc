import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker_bloc/branche/bloc/branch_bloc.dart';
import 'package:tracker_bloc/branche/bloc/branch_event.dart';
import 'package:tracker_bloc/project/bloc/project_event.dart';
import 'package:tracker_bloc/project/bloc/project_state.dart';
import 'package:tracker_bloc/project/model/project_model.dart';

import '../project_repository.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc(
    ProjectRepository projectsRepository
  )
  : _projectsRepository = projectsRepository,
  super(ProjectEmpty()) {
    on<LoadingProject>(_onLoadedProjects);
    on<UpdatedProject>(_onUpdatedProject);
  }

  final ProjectRepository _projectsRepository;

  void _onLoadedProjects(
    LoadingProject event,
    Emitter<ProjectState> emit
  ) async {
    List<Project> projects = await _projectsRepository.getProjectList();
    return emit(ProjectLoaded(projects));
  }

  void _onUpdatedProject(
    UpdatedProject event,
    Emitter<ProjectState> emit
  ) {
    final state = this.state;
    if (state is ProjectLoaded) {
      final List<Project> updatedProject =
        state.projects.map<Project>((project) {
          return project.id == event.project.id ? event.project : project;
        }).toList();
      // updatedProject.add(Project(id: 7, name: 'azaza'));
      return emit(ProjectLoaded(updatedProject));
    }
  }
}

