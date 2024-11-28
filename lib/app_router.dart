import 'package:flutter/material.dart';
import 'package:movies_app/data/web_services/characters_web_services.dart';
import 'package:movies_app/presentation/screens/character_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/screens/characters_screen.dart';
import 'constants/strings.dart';
import 'data/models/character.dart';
import 'data/repository/characters_repository.dart';
import 'domain/characters_cubit.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => charactersCubit,
                  child: CharactersScreen(),
                ));

      case characterDetailsScreen:
        final characterId = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(characterId: characterId));
    }
  }
}