import 'package:core/core.dart';
import 'package:orsai_project/environment_config.dart';

abstract class IoCManager {
  static late InjectorContainer injector;
  static void registerDependencies() {
    injector = InjectorContainer.register(GetItInjector());

    injector.registerLazySingleton<NavigationManager>(
      () => NavigationManagerImpl(),
    );

    injector.registerFactoryByName(
      () => EnvironmentConfig.baseUrl,
      'baseUrl',
    );
    injector.registerFactoryByName(
      () => EnvironmentConfig.apiKey,
      'apiKey',
    );
    injector.registerFactoryByName(
      () => EnvironmentConfig.language,
      'language',
    );

    injector.registerLazySingleton<SnackBarManager>(
      () => SnackBarManagerImpl(),
    );

    injector.registerLazySingleton<CustomTopSnackBarManager>(
        () => CustomTopSnackBarManagerImpl());

    injector.registerLazySingleton<EventBus>(
      () => EventBusImpl(),
    );

    injector.registerLazySingleton<ConnectionHelper>(
      () => ConnectionHelperImpl(),
    );
  }
}
