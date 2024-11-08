import 'package:flutter/material.dart';
import 'package:movies_app/presentation/screens/character_details.dart';
import 'package:movies_app/presentation/screens/characters_screen.dart';
import 'constants/strings.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen :
        return MaterialPageRoute(builder: (_) => const CharactersScreen());

        case characterDetailsScreen :
        return MaterialPageRoute(builder: (_) => const CharacterDetailsScreen());
    }
  }
}