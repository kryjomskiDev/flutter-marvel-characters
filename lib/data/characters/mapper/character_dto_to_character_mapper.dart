import 'package:injectable/injectable.dart';
import 'package:marvel_characters/data/characters/model/character_dto.dart';
import 'package:marvel_characters/data/characters/model/result_dto.dart';
import 'package:marvel_characters/domain/characters/model/character.dart';
import 'package:marvel_characters/generated/l10n.dart';

@injectable
class CharacterDtoToCharacterMapper {
  List<Character> call({required CharacterDto dto}) {
    final List<ResultDto> results = dto.data.results;

    final characters = <Character>[];

    for (final result in results) {
      final imgUrl = '${result.thumbnail.path}/landscape_incredible.${result.thumbnail.extension}';

      characters.add(
        Character(
          description: result.descritpion ?? Strings.current.na,
          id: result.id.toString(),
          imgUrl: imgUrl,
          name: result.name ?? Strings.current.na,
        ),
      );
    }
    return characters;
  }
}
