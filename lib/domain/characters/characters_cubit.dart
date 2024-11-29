import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/character.dart';
import '../../data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  void getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
    }).catchError((error) {
      emit(CharactersError());
    });
  }
}