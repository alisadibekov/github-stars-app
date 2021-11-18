import 'package:dartz/dartz.dart';
import 'package:github_star_app/domain/entities/repositories_entity.dart';

abstract class RepositoriesRepository {
  Future<Either<Error, RepositoriesEntity>> getRepositories(int page);
}
