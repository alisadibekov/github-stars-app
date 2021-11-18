import 'package:equatable/equatable.dart';

class RepositoryEntity extends Equatable {
  final Map<String, dynamic> owner;
  final String photoURL;
  final String name;
  final dynamic description;
  final int stars;
  final int issues;
  final String pushedAt;

  const RepositoryEntity({
    required this.owner,
    required this.photoURL,
    required this.name,
    required this.description,
    required this.stars,
    required this.issues,
    required this.pushedAt,
  });

  @override
  List<Object?> get props {
    return [
      owner,
      photoURL,
      name,
      description,
      stars,
      issues,
      pushedAt,
    ];
  }
}
