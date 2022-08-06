import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel_characters/injectable/injectable.dart';
import 'package:marvel_characters/marvel_characters_app.dart';
import 'package:marvel_characters/presentation/router/router.gr.dart';

const _supportedEnvironments = [Environment.dev, Environment.prod];

Future<void>? runMobileApp(String environment) async => runZonedGuarded(
      () {
        if (!_supportedEnvironments.contains(environment)) {
          throw ArgumentError('Environment $environment is not suppported');
        }

        configureDependecies(environment);
        runApp(MarvelCharactersApp(mainRouter: MainRouter()));
      },
      (err, st) {},
    );
