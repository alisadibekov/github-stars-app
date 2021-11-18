import 'package:github_star_app/domain/entities/repository_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repository_model.g.dart';

@JsonSerializable()
class RepositoryModel extends RepositoryEntity {
  const RepositoryModel({
    @JsonKey(name: 'owner') required Map<String, dynamic> owner,
    @JsonKey(name: 'avatar_url') required String photoURL,
    @JsonKey(name: 'full_name') required String name,
    @JsonKey(name: 'description') required dynamic description,
    @JsonKey(name: 'stargazers_count') required int stars,
    @JsonKey(name: 'open_issues') required int issues,
    @JsonKey(name: 'pushed_at') required String pushedAt,
  }) : super(
          owner: owner,
          photoURL: photoURL,
          name: name,
          description: description,
          stars: stars,
          issues: issues,
          pushedAt: pushedAt,
        );

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return _$RepositoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RepositoryModelToJson(this);
}
