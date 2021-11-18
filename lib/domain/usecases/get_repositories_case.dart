import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:github_star_app/data/models/repository_model.dart';
import 'package:github_star_app/domain/entities/repositories_entity.dart';
import 'package:github_star_app/domain/repositories/repositories_repository.dart';
import 'package:github_star_app/foundation/usecase.dart';

class GetRepositoriesCase implements UseCase<RepositoriesEntity, Params> {
  final RepositoriesRepository repositoriesRepository;

  GetRepositoriesCase({required this.repositoriesRepository});

  @override
  Future<Either<Error, RepositoriesEntity>> call(Params params) async {
    return await repositoriesRepository.getRepositories(params.page);
  }
}

class Params extends Equatable {
  final int page;

  const Params({required this.page});

  @override
  List<Object> get props => [page];
}
