// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataDto _$DataDtoFromJson(Map<String, dynamic> json) => DataDto(
      count: json['count'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => ResultDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
