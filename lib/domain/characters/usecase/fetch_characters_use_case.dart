import 'package:injectable/injectable.dart';
import 'package:marvel_characters/domain/characters/model/character.dart';
import 'package:marvel_characters/domain/characters/repository/characters_repository.dart';

@injectable
class FetchCharactersUseCase {
  final CharactersRepository _charactersRepository;

  const FetchCharactersUseCase(this._charactersRepository);

  Future<List<Character>> call({
    required int offset,
    required int limit,
  }) =>
      _charactersRepository.getCharacters(
        limit: limit,
        offset: offset,
      );
}
