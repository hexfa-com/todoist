import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todoist/core/error/failure.dart';
import 'package:todoist/domain/entities/project.dart';
import 'package:todoist/domain/repositories/projects_repository.dart';
import 'package:todoist/domain/usecases/get_projects_usecase.dart';

class MockProjectsRepository extends Mock implements ProjectsRepository {}

void main() {
  late GetProjects usecase;
  late MockProjectsRepository mockRepository;

  setUp(() {
    mockRepository = MockProjectsRepository();
    usecase = GetProjects(mockRepository);
  });

  test('should get projects from the repository', () async {
    final projects = [
      Project(
        id: '2203306141',
        name: 'Shopping List',
        commentCount: 10,
        order: 1,
        color: 'charcoal',
        isShared: false,
        isFavorite: false,
        parentId: '220325187',
        isInboxProject: false,
        isTeamInbox: false,
        viewStyle: 'list',
        url: 'https://todoist.com/showProject?id=2203306141',
      )
    ];

    when(mockRepository.getProjects()).thenAnswer((_) async => Right(projects));

    final result = await usecase(NoParams());

    expect(result, Right(projects));
    verify(mockRepository.getProjects());
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return ServerFailure when something goes wrong', () async {
    when(mockRepository.getProjects())
        .thenAnswer((_) async => Left(ServerFailure()));

    final result = await usecase(NoParams());

    expect(result, Left(ServerFailure()));
    verify(mockRepository.getProjects());
    verifyNoMoreInteractions(mockRepository);
  });
}
