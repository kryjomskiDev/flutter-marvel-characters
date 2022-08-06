import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_characters/domain/characters/model/character.dart';
import 'package:marvel_characters/generated/l10n.dart';
import 'package:marvel_characters/injectable/injectable.dart';
import 'package:marvel_characters/presentation/pages/home/cubit/home_page_cubit.dart';
import 'package:marvel_characters/presentation/pages/home/cubit/home_page_state.dart';
import 'package:marvel_characters/presentation/pages/home/widgets/characters_list.dart';
import 'package:marvel_characters/presentation/widgets/character_card.dart';
import 'package:marvel_characters/style/app_typography.dart';
import 'package:marvel_characters/extension/extension_mixin.dart';

class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => getIt<HomePageCubit>()..init(),
        child: this,
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: context.getColors().transparent,
          shadowColor: context.getColors().transparent,
          title: Text(
            Strings.of(context).title,
            style: AppTypography.title,
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) => state.maybeWhen(
              loading: () => CharactersList(
                characters: context.read<HomePageCubit>().characters,
                isLoading: true,
                controller: context.read<HomePageCubit>().controller,
              ),
              loaded: () => CharactersList(
                characters: context.read<HomePageCubit>().characters,
                isLoading: false,
                controller: context.read<HomePageCubit>().controller,
              ),
              orElse: () => const SizedBox.shrink(),
            ),
          ),
        ),
      );
}
