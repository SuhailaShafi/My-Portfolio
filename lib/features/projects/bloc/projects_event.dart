import 'package:equatable/equatable.dart';
import '../../../data/models/project_model.dart';

abstract class ProjectsEvent extends Equatable {
  const ProjectsEvent();

  @override
  List<Object?> get props => [];
}

class LoadProjects extends ProjectsEvent {
  const LoadProjects();
}

class AddProject extends ProjectsEvent {
  final ProjectModel project;

  const AddProject(this.project);

  @override
  List<Object?> get props => [project];
}

class UpdateProject extends ProjectsEvent {
  final ProjectModel project;

  const UpdateProject(this.project);

  @override
  List<Object?> get props => [project];
}

class DeleteProject extends ProjectsEvent {
  final String projectId;

  const DeleteProject(this.projectId);

  @override
  List<Object?> get props => [projectId];
}
