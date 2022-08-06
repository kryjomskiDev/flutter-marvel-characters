import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_characters/data/characters/model/result_dto.dart';

part 'data_dto.g.dart';

@JsonSerializable(createToJson: false)
class DataDto extends Equatable {
  final int count;
  final List<ResultDto> results;

  const DataDto({
    required this.count,
    required this.results,
  });

  factory DataDto.fromJson(Map<String, dynamic> json) => _$DataDtoFromJson(json);

  @override
  List<Object?> get props => [results, count];
}
