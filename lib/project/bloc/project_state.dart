import 'package:equatable/equatable.dart';
import 'package:tracker_bloc/project/model/project_model.dart';

abstract class ProjectState extends Equatable {
  const ProjectState();

  @override
  List<Object> get props => [];
}

class ProjectEmpty extends ProjectState {}

class ProjectLoading extends ProjectState {}

class ProjectLoaded extends ProjectState {
  final List<Project> projects;

  const ProjectLoaded([this.projects = const []]);

  @override
  List<Object> get props => [projects];
}