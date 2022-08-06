import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel_characters/domain/characters/model/character.dart';
import 'package:marvel_characters/domain/characters/usecase/fetch_characters_use_case.dart';
import 'package:marvel_characters/presentation/pages/home/cubit/home_page_state.dart';
import 'package:marvel_characters/utils/safety_cubit.dart';

@injectable
class HomePageCubit extends MarvelCharactersCubit<HomePageState> {
  final FetchCharactersUseCase fetchCharactersUseCase;
  final List<Character> characters = [];
  final ScrollController controller = ScrollController();
  int offset = 0;

  static const limit = 30;

  HomePageCubit(this.fetchCharactersUseCase) : super(const HomePageState.inital());

  Future<void> init() async {
    controller.addListener(scrollControllerListener);
    emit(const HomePageState.loading());
    characters.addAll(await fetchCharactersUseCase.call(limit: limit, offset: 0));
    offset += limit;
    emit(const HomePageState.loaded());
  }

  Future<void> scrollControllerListener() async {
    if (state is HomePageLoaded && controller.position.pixels == controller.position.maxScrollExtent) {
      emit(const HomePageState.loading());
      characters.addAll(await fetchCharactersUseCase.call(limit: limit, offset: offset));
      offset += limit;
      emit(const HomePageState.loaded());
    }
  }

  @override
  Future<void> close() {
    controller.removeListener(scrollControllerListener);
    return super.close();
  }
}
