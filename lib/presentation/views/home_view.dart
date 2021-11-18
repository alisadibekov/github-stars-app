import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_star_app/data/models/repository_model.dart';
import 'package:github_star_app/presentation/bloc/repositories_bloc.dart';
import 'package:github_star_app/presentation/guidelines/color_guide.dart';
import 'package:github_star_app/presentation/guidelines/distance_guide.dart';
import 'package:github_star_app/presentation/widgets/repository_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();
  final List<RepositoryModel> repositories = [];

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        context.read<RepositoriesBloc>()
          ..isFetching = true
          ..add(GetRepositoriesEvent());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<RepositoriesBloc>().add(GetRepositoriesEvent());

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: ColorGuide.primaryColor,
            middle: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Scroll down'),
                Icon(Icons.arrow_downward),
              ],
            ),
            largeTitle: Row(
              children: const [
                Text('GitHub'),
                Text(
                  'Star',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ],
            ),
            border: null,
          ),
          SliverToBoxAdapter(
            child: FractionallySizedBox(
              widthFactor: DistanceGuide.kWidthFactor,
              child: Column(
                children: [
                  Image.asset('assets/illustration.png'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Divider(),
                      Text('Please, scroll down'),
                      Divider(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<RepositoriesBloc, RepositoriesState>(
            builder: (context, state) {
              if (state is RepositoriesLoadingState) {
                return SliverFillRemaining(
                    child: Center(child: CupertinoActivityIndicator()));
              } else if (state is RepositoriesSuccessState) {
                repositories.addAll(state.repositories.repositories);
                context.read<RepositoriesBloc>().isFetching = false;
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index == repositories.length - 2) {
                        return CupertinoActivityIndicator();
                      }
                      return FractionallySizedBox(
                        widthFactor: DistanceGuide.kWidthFactor,
                        child: RepositoryCard(repository: repositories[index]),
                      );
                    },
                    childCount: repositories.length,
                  ),
                );
              } else if (state is RepositoriesFailureState) {
                return SliverFillRemaining(
                  child: Center(child: Text('Error')),
                );
              }
              return SizedBox();
            },
          )
        ],
      ),
    );
  }
}
