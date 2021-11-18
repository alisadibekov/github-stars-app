part of 'repositories_bloc.dart';

abstract class RepositoriesState extends Equatable {
  const RepositoriesState();

  @override
  List<Object> get props => [];
}

class RepositoriesLoadingState extends RepositoriesState {}

class RepositoriesSuccessState extends RepositoriesState {
  final RepositoriesEntity repositories;

  const RepositoriesSuccessState({required this.repositories});

  @override
  List<Object> get props => [repositories];
}

class RepositoriesFailureState extends RepositoriesState {
  final String message;

  const RepositoriesFailureState({required this.message});

  @override
  List<Object> get props => [message];
}
