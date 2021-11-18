import 'package:github_star_app/data/models/repository_model.dart';
import 'package:github_star_app/domain/entities/repositories_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repositories_model.g.dart';

@JsonSerializable()
class RepositoriesModel extends RepositoriesEntity {
  const RepositoriesModel({
    @JsonKey(name: 'items') required List<RepositoryModel> repositories,
  }) : super(repositories: repositories);

  factory RepositoriesModel.fromJson(Map<String, dynamic> json) {
    return _$RepositoriesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RepositoriesModelToJson(this);
}
