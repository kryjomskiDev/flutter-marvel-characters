import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thumbnail_dto.g.dart';

@JsonSerializable(createToJson: false)
class ThumbnailDto extends Equatable {
  final String? path;
  final String? extension;

  const ThumbnailDto({required this.extension, required this.path});

  factory ThumbnailDto.fromJson(Map<String, dynamic> json) => _$ThumbnailDtoFromJson(json);

  @override
  List<Object?> get props => [path, extension];
}
