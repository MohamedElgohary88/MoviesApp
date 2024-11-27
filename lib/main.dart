import 'package:flutter/material.dart';
import 'package:movies_app/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repository/characters_repository.dart';
import 'data/web_services/characters_web_services.dart';
import 'domain/characters_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CharactersCubit(CharactersRepository(CharactersWebServices()))),
      ],
      child: RicklantisApp(appRouter: AppRouter()),
    ),
  );
}


class RicklantisApp extends StatelessWidget {

  final AppRouter appRouter;

  const RicklantisApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
