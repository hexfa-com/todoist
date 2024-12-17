// lib/features/projects/presentation/bloc/projects_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoist/presentation/bloc/project_event.dart';
import 'package:todoist/presentation/bloc/project_state.dart';

import '../../domain/usecases/get_projects_usecase.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final GetProjects getProjectsUseCase;

  ProjectsBloc(this.getProjectsUseCase) : super(ProjectsInitial()) {
    on<FetchProjectsEvent>((event, emit) async {
      emit(ProjectsLoading());
      print("ProjectsLoading");
      final result = await getProjectsUseCase(NoParams());
      print("result$result");
      result.fold(
        (failure) => emit(ProjectsError('Failed to load projects')),
        (projects) => emit(ProjectsLoaded(projects)),
      );
    });
  }
}
