// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoriesModel _$RepositoriesModelFromJson(Map<String, dynamic> json) =>
    RepositoriesModel(
      repositories: (json['items'] as List<dynamic>)
          .map((e) => RepositoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RepositoriesModelToJson(RepositoriesModel instance) =>
    <String, dynamic>{
      'repositories': instance.repositories,
    };
