import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/character.dart';
import '../characters/characters_cubit.dart';

part 'character_details_state.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  CharacterDetailsCubit() : super(CharacterDetailsInitial());

  void getCharacterDetails(Character character) {
    emit(CharacterDetailsLoaded(character: character));
  }

}