// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvel_characters_api_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _MarvelCharactersApiDataSource implements MarvelCharactersApiDataSource {
  _MarvelCharactersApiDataSource(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CharacterDto> getCharacters(apiKey, hash, offset, limit) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        CharacterDto>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'characters?offset=${offset}&limit=${limit}&ts=1&apikey=${apiKey}&hash=${hash}',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CharacterDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CharacterDto> getCharactersByName(apiKey, hash, name) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CharacterDto>(Options(
                method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options,
                'characters?name=${name}&ts=1&apikey=${apiKey}&hash=${hash}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CharacterDto.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
