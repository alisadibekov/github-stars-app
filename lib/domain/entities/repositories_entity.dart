import 'package:equatable/equatable.dart';
import 'package:github_star_app/data/models/repository_model.dart';
import 'package:json_annotation/json_annotation.dart';

class RepositoriesEntity extends Equatable {
  final List<RepositoryModel> repositories;

  const RepositoriesEntity({required this.repositories});

  @override
  List<Object?> get props => [repositories];
}
