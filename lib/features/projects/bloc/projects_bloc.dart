import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/portfolio_repository.dart';
import 'projects_event.dart';
import 'projects_state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final PortfolioRepository _portfolioRepository;

  ProjectsBloc(this._portfolioRepository) : super(const ProjectsInitial()) {
    on<LoadProjects>(_onLoadProjects);
    on<AddProject>(_onAddProject);
    on<UpdateProject>(_onUpdateProject);
    on<DeleteProject>(_onDeleteProject);
  }

  Future<void> _onLoadProjects(
    LoadProjects event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(const ProjectsLoading());
    try {
      final projects = await _portfolioRepository.getProjects();
      if (projects.isEmpty) {
        emit(const ProjectsEmpty());
      } else {
        emit(ProjectsLoaded(projects));
      }
    } catch (e) {
      emit(ProjectsError('Failed to load projects: $e'));
    }
  }

  Future<void> _onAddProject(
    AddProject event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(const ProjectsLoading());
    try {
      final updatedProjects = await _portfolioRepository.addProject(
        event.project,
      );
      emit(ProjectsLoaded(updatedProjects));
    } catch (e) {
      emit(ProjectsError('Failed to add project: $e'));
    }
  }

  Future<void> _onUpdateProject(
    UpdateProject event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(const ProjectsLoading());
    try {
      final updatedProjects = await _portfolioRepository.updateProject(
        event.project,
      );
      emit(ProjectsLoaded(updatedProjects));
    } catch (e) {
      emit(ProjectsError('Failed to update project: $e'));
    }
  }

  Future<void> _onDeleteProject(
    DeleteProject event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(const ProjectsLoading());
    try {
      final updatedProjects = await _portfolioRepository.deleteProject(
        event.projectId,
      );
      if (updatedProjects.isEmpty) {
        emit(const ProjectsEmpty());
      } else {
        emit(ProjectsLoaded(updatedProjects));
      }
    } catch (e) {
      emit(ProjectsError('Failed to delete project: $e'));
    }
  }
}
