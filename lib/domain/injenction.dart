import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:github_star_app/data/repositories/repositories_repository_impl.dart';
import 'package:github_star_app/data/sources/repository_remote_source.dart';
import 'package:github_star_app/domain/repositories/repositories_repository.dart';
import 'package:github_star_app/domain/usecases/get_repositories_case.dart';
import 'package:github_star_app/foundation/client.dart';
import 'package:github_star_app/presentation/bloc/repositories_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory(() => RepositoriesBloc(getRepositories: locator()));
  locator.registerLazySingleton(
      () => GetRepositoriesCase(repositoriesRepository: locator()));

  locator.registerLazySingleton<RepositoriesRepository>(
    () => RepositoriesRepositoryImpl(
      repositoryRemoteSource: locator(),
    ),
  );

  locator.registerLazySingleton<RepositoriesRemoteSource>(
    () => RepositoryRemoteSourceImpl(
      client: locator(),
    ),
  );

  locator.registerLazySingleton(() => Client().init());
}
