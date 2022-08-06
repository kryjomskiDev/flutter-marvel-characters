import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_characters/extension/build_context_extension.dart';
import 'package:marvel_characters/injectable/injectable.dart';
import 'package:marvel_characters/presentation/pages/search/cubit/search_page_cubit.dart';
import 'package:marvel_characters/presentation/pages/search/cubit/search_page_state.dart';
import 'package:marvel_characters/presentation/pages/search/widgets/search_field.dart';
import 'package:marvel_characters/presentation/widgets/character_card.dart';

class SearchPage extends StatelessWidget implements AutoRouteWrapper {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => getIt<SearchPageCubit>(),
        child: this,
      );

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: context.getColors().transparent,
        title: SearchField(
          onSubmitted: context.read<SearchPageCubit>().searchForCharacter,
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<SearchPageCubit, SearchPageState>(
          builder: (context, state) => state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (character) => Center(
              child: CharacterCard(character: character),
            ),
            orElse: () => const SizedBox.shrink(),
          ),
        ),
      ));
}
