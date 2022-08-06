import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel_characters/data/api_url_provider.dart';
import 'package:marvel_characters/injectable/dio/dio_injectable.mocks.dart';
import 'package:mockito/annotations.dart';

const timeout = Duration(seconds: 20);

@GenerateMocks([Dio])
@module
abstract class DioModule {
  @lazySingleton
  @dev
  @prod
  Dio dio(ApiUrlProvider apiUrlProvider) {
    final dio = Dio(BaseOptions(
      sendTimeout: timeout.inMilliseconds,
      connectTimeout: timeout.inMilliseconds,
      receiveTimeout: timeout.inMilliseconds,
      baseUrl: apiUrlProvider.getApiUrl(),
    ));

    return dio;
  }

  @singleton
  @test
  Dio testDio() => MockDio();
}
