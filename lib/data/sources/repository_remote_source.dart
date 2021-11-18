import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:github_star_app/data/models/repositories_model.dart';

abstract class RepositoriesRemoteSource {
  Future<RepositoriesModel> getRepositories(int page);
}

class RepositoryRemoteSourceImpl implements RepositoriesRemoteSource {
  final Dio client;

  RepositoryRemoteSourceImpl({required this.client});

  @override
  Future<RepositoriesModel> getRepositories(int page) => _getRepositories(page);

  Future<RepositoriesModel> _getRepositories(int page) async {
    try {
      final response = await client.get(
          '/repositories?q=created:>2021-10-14&sort=stars&order=desc&per_page=15&page=$page');
      final jsonResponse = json.decode(json.encode(response.data));
      final repositories = RepositoriesModel.fromJson(jsonResponse);
      return repositories;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
