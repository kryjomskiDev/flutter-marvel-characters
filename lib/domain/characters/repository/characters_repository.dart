import 'package:marvel_characters/domain/characters/model/character.dart';

abstract class CharactersRepository {
  Future<List<Character>> getCharacters({
    required int offset,
    required int limit,
  });
  Future<Character> searchByName(String characterName);
}
