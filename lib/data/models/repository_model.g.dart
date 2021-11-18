// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryModel _$RepositoryModelFromJson(Map<String, dynamic> json) =>
    RepositoryModel(
      owner: json['owner'] as Map<String, dynamic>,
      photoURL: json['owner']['avatar_url'] as String,
      name: json['full_name'] as String,
      description: json['description'] as dynamic,
      stars: json['stargazers_count'] as int,
      issues: json['open_issues'] as int,
      pushedAt: json['pushed_at'] as String,
    );

Map<String, dynamic> _$RepositoryModelToJson(RepositoryModel instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'photoURL': instance.photoURL,
      'name': instance.name,
      'description': instance.description,
      'stars': instance.stars,
      'issues': instance.issues,
      'pushedAt': instance.pushedAt,
    };
