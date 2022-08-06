import 'package:auto_route/auto_route.dart';
import 'package:marvel_characters/presentation/pages/character_details/character_details_page.dart';
import 'package:marvel_characters/presentation/pages/home/home_page.dart';
import 'package:marvel_characters/presentation/pages/main_page/main_page.dart';
import 'package:marvel_characters/presentation/pages/search/search_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      page: MainPage,
      path: 'main-page',
      children: [
        AutoRoute(page: HomePage, path: 'home'),
        AutoRoute(page: SearchPage, path: 'search'),
        AutoRoute(page: CharacterDetailsPage, path: 'character-details'),
      ],
    ),
  ],
)
class $MainRouter {}
