import 'package:injectable/injectable.dart';
import 'package:marvel_characters/data/api_url_provider.dart';
import 'package:marvel_characters/data/characters/data_source/marvel_characters_api_data_source.dart';
import 'package:marvel_characters/data/characters/mapper/character_dto_to_character_mapper.dart';
import 'package:marvel_characters/domain/characters/model/character.dart';
import 'package:marvel_characters/domain/characters/repository/characters_repository.dart';

@LazySingleton(as: CharactersRepository)
class CharactersRepositoryImpl extends CharactersRepository {
  final MarvelCharactersApiDataSource _dataSource;
  final CharacterDtoToCharacterMapper _mapper;
  final ApiUrlProvider _apiUrlProvider;

  CharactersRepositoryImpl(
    this._dataSource,
    this._mapper,
    this._apiUrlProvider,
  );

  @override
  Future<List<Character>> getCharacters({
    required int offset,
    required int limit,
  }) async =>
      _mapper(
        dto: await _dataSource.getCharacters(
          _apiUrlProvider.apiKey(),
          _apiUrlProvider.hash(),
          offset,
          limit,
        ),
      );

  @override
  Future<Character> searchByName(String characterName) async {
    final foundedCharacters =
        await _dataSource.getCharactersByName(_apiUrlProvider.apiKey(), _apiUrlProvider.hash(), characterName);

    return _mapper(dto: foundedCharacters).first;
  }
}
