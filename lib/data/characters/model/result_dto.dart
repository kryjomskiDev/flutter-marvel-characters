import 'package:equatable/equatable.dart';
import 'package:marvel_characters/data/characters/model/thumbnail_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_dto.g.dart';

@JsonSerializable(createToJson: false)
class ResultDto extends Equatable {
  final int? id;
  final String? name;
  final String? descritpion;
  final ThumbnailDto thumbnail;

  const ResultDto({
    required this.id,
    required this.name,
    required this.descritpion,
    required this.thumbnail,
  });

  factory ResultDto.fromJson(Map<String, dynamic> json) => _$ResultDtoFromJson(json);

  @override
  List<Object?> get props => [id, name, descritpion, thumbnail];
}
