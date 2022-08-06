// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../domain/characters/model/character.dart' as _i7;
import '../pages/character_details/character_details_page.dart' as _i4;
import '../pages/home/home_page.dart' as _i2;
import '../pages/main_page/main_page.dart' as _i1;
import '../pages/search/search_page.dart' as _i3;

class MainRouter extends _i5.RootStackRouter {
  MainRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    SearchRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SearchPage());
    },
    CharacterDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CharacterDetailsRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.CharacterDetailsPage(
              character: args.character, key: args.key));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/', redirectTo: 'main-page', fullMatch: true),
        _i5.RouteConfig(MainRoute.name, path: 'main-page', children: [
          _i5.RouteConfig(HomeRoute.name, path: 'home', parent: MainRoute.name),
          _i5.RouteConfig(SearchRoute.name,
              path: 'search', parent: MainRoute.name),
          _i5.RouteConfig(CharacterDetailsRoute.name,
              path: 'character-details', parent: MainRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute({List<_i5.PageRouteInfo>? children})
      : super(MainRoute.name, path: 'main-page', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.SearchPage]
class SearchRoute extends _i5.PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: 'search');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i4.CharacterDetailsPage]
class CharacterDetailsRoute
    extends _i5.PageRouteInfo<CharacterDetailsRouteArgs> {
  CharacterDetailsRoute({required _i7.Character character, _i6.Key? key})
      : super(CharacterDetailsRoute.name,
            path: 'character-details',
            args: CharacterDetailsRouteArgs(character: character, key: key));

  static const String name = 'CharacterDetailsRoute';
}

class CharacterDetailsRouteArgs {
  const CharacterDetailsRouteArgs({required this.character, this.key});

  final _i7.Character character;

  final _i6.Key? key;

  @override
  String toString() {
    return 'CharacterDetailsRouteArgs{character: $character, key: $key}';
  }
}
