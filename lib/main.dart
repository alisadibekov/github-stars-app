import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_star_app/domain/injenction.dart';
import 'package:github_star_app/presentation/bloc/repositories_bloc.dart';
import 'package:github_star_app/domain/injenction.dart' as injenction;
import 'package:github_star_app/presentation/guidelines/color_guide.dart';
import 'package:github_star_app/presentation/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injenction.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<RepositoriesBloc>())
      ],
      child: LaunchView(),
    ),
  );
}

class LaunchView extends StatelessWidget {
  const LaunchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(key: key),
      theme: ThemeData(
        scaffoldBackgroundColor: ColorGuide.primaryColor,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
