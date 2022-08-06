import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvel_characters/generated/l10n.dart';
import 'package:marvel_characters/presentation/router/router.gr.dart';
import 'package:marvel_characters/style/app_typography.dart';
import 'package:marvel_characters/style/theme.dart';
import 'package:provider/provider.dart';

const _tabletSize = Size(750, 1334);
const _mobileSize = Size(375, 667);

class MarvelCharactersApp extends StatelessWidget {
  final MainRouter mainRouter;
  const MarvelCharactersApp({required this.mainRouter, super.key});

  @override
  Widget build(BuildContext context) {
    final themeModel = ThemeModel();
    return ScreenUtilInit(
      designSize: Device.get().isTablet ? _tabletSize : _mobileSize,
      builder: (_, __) => MultiProvider(
        providers: [
          ListenableProvider(create: (_) => themeModel),
        ],
        child: Consumer(
          builder: (context, value, child) => MaterialApp.router(
            routerDelegate: mainRouter.delegate(),
            routeInformationParser: mainRouter.defaultRouteParser(),
            localizationsDelegates: const [
              Strings.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            supportedLocales: Strings.delegate.supportedLocales,
            theme: ThemeData(
              fontFamily: AppTypography.fontFamily,
              useMaterial3: true,
              colorScheme: const ColorScheme.dark(),
              scaffoldBackgroundColor: themeModel.theme.bgColor,
              primaryColor: themeModel.theme.white,
            ),
          ),
        ),
      ),
    );
  }
}
