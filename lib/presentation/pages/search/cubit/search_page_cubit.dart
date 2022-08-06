import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel_characters/domain/characters/usecase/get_character_by_name_use_case.dart';
import 'package:marvel_characters/presentation/pages/search/cubit/search_page_state.dart';
import 'package:marvel_characters/utils/safety_cubit.dart';

@injectable
class SearchPageCubit extends MarvelCharactersCubit<SearchPageState> {
  final GetCharacterByNameUsecase _getCharacterByNameUsecase;
  SearchPageCubit(this._getCharacterByNameUsecase) : super(const SearchPageState.inital());

  Future<void> searchForCharacter(String characterName) async {
    emit(const SearchPageState.loading());
    final character = await _getCharacterByNameUsecase(characterName);
    emit(SearchPageState.loaded(character: character));
  }
}
