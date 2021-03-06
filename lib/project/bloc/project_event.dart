import 'package:equatable/equatable.dart';
import 'package:tracker_bloc/project/bloc/project_bloc.dart';
import 'package:tracker_bloc/project/model/project_model.dart';

abstract class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object> get props => [];
}

class LoadingProject extends ProjectEvent {}

class UpdatedProject extends ProjectEvent {
  final Project project;

  const UpdatedProject(this.project);

  @override
  List<Object> get props => [project];
}

class LoadingBranch extends ProjectEvent {
  final Project project;

  const LoadingBranch(this.project);

  @override
  List<Object> get props => [project];
}