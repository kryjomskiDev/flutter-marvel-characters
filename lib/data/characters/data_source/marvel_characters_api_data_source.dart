import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel_characters/data/characters/model/character_dto.dart';
import 'package:marvel_characters/networking_config/networking_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'marvel_characters_api_data_source.g.dart';

@injectable
@RestApi()
abstract class MarvelCharactersApiDataSource {
  @factoryMethod
  factory MarvelCharactersApiDataSource(Dio dio) = _MarvelCharactersApiDataSource;

  @GET(NetworkingEndpoints.getCharacters)
  Future<CharacterDto> getCharacters(
    @Path('api_key') String apiKey,
    @Path('hash') String hash,
    @Path('offset') int offset,
    @Path('limit') int limit,
  );

  @GET(NetworkingEndpoints.getCharachtersByName)
  Future<CharacterDto> getCharactersByName(
    @Path('api_key') String apiKey,
    @Path('hash') String hash,
    @Path('name') String name,
  );
}
