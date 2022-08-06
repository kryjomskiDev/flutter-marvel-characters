import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marvel_characters/domain/characters/model/character.dart';

part 'search_page_state.freezed.dart';

@freezed
class SearchPageState with _$SearchPageState {
  const factory SearchPageState.inital() = _SearchPageInitial;
  const factory SearchPageState.loaded({required Character character}) = SearchPageLoaded;
  const factory SearchPageState.loading() = SearchPageLoading;
}
