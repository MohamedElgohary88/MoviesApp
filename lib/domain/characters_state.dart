part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class CharactersLoaded extends CharactersState {
  final List<Character> characters;
  CharactersLoaded(this.characters);
}

final class CharactersError extends CharactersState {}

final class CharacterDetailsLoaded extends CharactersState {
  final Character character;
  CharacterDetailsLoaded(this.character);
}