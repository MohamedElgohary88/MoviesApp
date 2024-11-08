import '../models/character.dart';
import '../web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacters() async {
    final List<dynamic> charactersJson = await charactersWebServices.getAllCharacters();
    return charactersJson.map((json) => Character.fromJson(json)).toList();
  }

  Future<Character> getCharacterById(int id) async {
    final characterJson = await charactersWebServices.getCharacterById(id);
    return Character.fromJson(characterJson);
  }
}
