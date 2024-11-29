part of 'character_details_cubit.dart';

@immutable
sealed class CharacterDetailsState {}

final class CharacterDetailsInitial extends CharacterDetailsState {}

final class CharacterDetailsLoaded extends CharacterDetailsState {
  final Character character;

  CharacterDetailsLoaded({required this.character});
}

final class CharacterDetailsError extends CharacterDetailsState {}