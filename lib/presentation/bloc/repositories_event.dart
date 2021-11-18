part of 'repositories_bloc.dart';

abstract class RepositoriesEvent extends Equatable {
  const RepositoriesEvent();

  @override
  List<Object> get props => [];
}

class GetRepositoriesEvent extends RepositoriesEvent {}
