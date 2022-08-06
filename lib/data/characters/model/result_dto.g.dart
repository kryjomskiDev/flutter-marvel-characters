// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultDto _$ResultDtoFromJson(Map<String, dynamic> json) => ResultDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      descritpion: json['descritpion'] as String?,
      thumbnail:
          ThumbnailDto.fromJson(json['thumbnail'] as Map<String, dynamic>),
    );
