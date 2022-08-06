import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MarvelCharactersCubit<State> extends BlocBase<State> {
  MarvelCharactersCubit(super.state);

  @override
  void emit(State state) {
    if (isClosed) {
      return;
    }
    super.emit(state);
  }
}
