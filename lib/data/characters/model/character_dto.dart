import 'package:equatable/equatable.dart';
import 'package:marvel_characters/data/characters/model/data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_dto.g.dart';

@JsonSerializable(createToJson: false)
class CharacterDto extends Equatable {
  final DataDto data;

  const CharacterDto({required this.data});

  factory CharacterDto.fromJson(Map<String, dynamic> json) => _$CharacterDtoFromJson(json);

  @override
  List<Object?> get props => [];
}
