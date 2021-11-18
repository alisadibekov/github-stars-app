import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_star_app/domain/entities/repositories_entity.dart';
import 'package:github_star_app/domain/usecases/get_repositories_case.dart';

part 'repositories_event.dart';
part 'repositories_state.dart';

class RepositoriesBloc extends Bloc<RepositoriesEvent, RepositoriesState> {
  final GetRepositoriesCase getRepositories;
  int page = 1;
  bool isFetching = false;

  RepositoriesBloc({
    required this.getRepositories,
  }) : super(RepositoriesLoadingState()) {
    on<GetRepositoriesEvent>(_onGetRepositoriesEvent);
  }

  _onGetRepositoriesEvent(
    GetRepositoriesEvent event,
    Emitter emit,
  ) async {
    try {
      final repositories = await getRepositories(Params(page: page));

      if (isFetching) page += 1;

      repositories.fold(
        (l) => RepositoriesFailureState(message: 'Error'),
        (r) => emit(RepositoriesSuccessState(repositories: r)),
      );
    } catch (e) {
      return e;
    }
  }
}
