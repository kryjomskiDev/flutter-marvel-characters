import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel_characters/injectable/injectable.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependecies(String environment) => $initGetIt(
      getIt,
      environment: environment,
    );
