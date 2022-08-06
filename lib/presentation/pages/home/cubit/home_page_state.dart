import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.inital() = _HomePageInitial;
  const factory HomePageState.loading() = HomePageLoading;
  const factory HomePageState.loaded() = HomePageLoaded;
}
