import 'package:injectable/injectable.dart';
import 'package:marvel_characters/domain/characters/model/character.dart';
import 'package:marvel_characters/domain/characters/repository/characters_repository.dart';

@injectable
class GetCharacterByNameUsecase {
  final CharactersRepository _repository;

  const GetCharacterByNameUsecase(this._repository);

  Future<Character> call(String name) => _repository.searchByName(name);
}
