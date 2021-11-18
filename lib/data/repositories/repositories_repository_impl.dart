import 'package:dartz/dartz.dart';
import 'package:github_star_app/data/sources/repository_remote_source.dart';
import 'package:github_star_app/domain/entities/repositories_entity.dart';
import 'package:github_star_app/domain/repositories/repositories_repository.dart';

typedef _RepositoriesEntityType = Future<RepositoriesEntity> Function();

class RepositoriesRepositoryImpl implements RepositoriesRepository {
  final RepositoriesRemoteSource repositoryRemoteSource;

  RepositoriesRepositoryImpl({required this.repositoryRemoteSource});

  @override
  Future<Either<Error, RepositoriesEntity>> getRepositories(int page) async {
    return await _getRepositories(
      () => repositoryRemoteSource.getRepositories(page),
    );
  }

  Future<Either<Error, RepositoriesEntity>> _getRepositories(
    _RepositoriesEntityType getRepositories,
  ) async {
    try {
      final RepositoriesEntity repositories = await getRepositories();
      return Right(repositories);
    } catch (e) {
      throw Exception(e);
    }
  }
}
