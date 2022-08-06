// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api_url_provider.dart' as _i3;
import '../data/characters/data_source/marvel_characters_api_data_source.dart'
    as _i6;
import '../data/characters/mapper/character_dto_to_character_mapper.dart'
    as _i4;
import '../data/characters/repository/characters_repository_impl.dart' as _i8;
import '../domain/characters/repository/characters_repository.dart' as _i7;
import '../domain/characters/usecase/fetch_characters_use_case.dart' as _i9;
import '../domain/characters/usecase/get_character_by_name_use_case.dart'
    as _i10;
import '../presentation/pages/home/cubit/home_page_cubit.dart' as _i11;
import '../presentation/pages/search/cubit/search_page_cubit.dart' as _i12;
import 'dio/dio_injectable.dart' as _i13;

const String _dev = 'dev';
const String _prod = 'prod';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioModule = _$DioModule();
  gh.singleton<_i3.ApiUrlProvider>(_i3.ApiUrlProvider());
  gh.factory<_i4.CharacterDtoToCharacterMapper>(
      () => _i4.CharacterDtoToCharacterMapper());
  gh.lazySingleton<_i5.Dio>(() => dioModule.dio(get<_i3.ApiUrlProvider>()),
      registerFor: {_dev, _prod});
  gh.singleton<_i5.Dio>(dioModule.testDio(), registerFor: {_test});
  gh.factory<_i6.MarvelCharactersApiDataSource>(
      () => _i6.MarvelCharactersApiDataSource(get<_i5.Dio>()));
  gh.lazySingleton<_i7.CharactersRepository>(() => _i8.CharactersRepositoryImpl(
      get<_i6.MarvelCharactersApiDataSource>(),
      get<_i4.CharacterDtoToCharacterMapper>(),
      get<_i3.ApiUrlProvider>()));
  gh.factory<_i9.FetchCharactersUseCase>(
      () => _i9.FetchCharactersUseCase(get<_i7.CharactersRepository>()));
  gh.factory<_i10.GetCharacterByNameUsecase>(
      () => _i10.GetCharacterByNameUsecase(get<_i7.CharactersRepository>()));
  gh.factory<_i11.HomePageCubit>(
      () => _i11.HomePageCubit(get<_i9.FetchCharactersUseCase>()));
  gh.factory<_i12.SearchPageCubit>(
      () => _i12.SearchPageCubit(get<_i10.GetCharacterByNameUsecase>()));
  return get;
}

class _$DioModule extends _i13.DioModule {}
