import 'package:core/core.dart';
import 'package:sign_in/src/data/repositories/get_token_remote_repository_impl.dart';
import 'package:sign_in/src/data/repositories/sign_in_remote_repository_impl.dart';
import 'package:sign_in/src/domain/interactor/sign_in_use_case.dart';
import 'package:sign_in/src/domain/interactor/sign_in_use_case_impl.dart';
import 'package:sign_in/src/domain/repositories/get_token_remote_repository.dart';
import 'package:sign_in/src/domain/repositories/sign_in_remote_repository.dart';
import 'package:sign_in/src/presentation/cubit/sign_in_cubit.dart';

abstract class SignInInitializer {
  static registerDependencies() {
    var injector = InjectorContainer.instance;

    injector.registerFactory<LocalStorageManager>(
      () => LocalStorageManagerImpl(),
    );

    injector.registerFactory<TokenDecoderManager>(
      () => TokenDecorManagerImpl(),
    );

    injector.registerFactory<SvgAssetsManager>(
      () => SgvAssetsManagerImpl(),
    );

    injector.registerFactory<SnackBarManager>(
      () => SnackBarManagerImpl(),
    );

    injector.registerFactory<CustomTopSnackBarManager>(
      () => CustomTopSnackBarManagerImpl(),
    );

    injector.registerFactory<UrlLauncherManager>(
      () => UrlLauncherManagerImpl(),
    );

    injector.registerFactory<SignInUseCase>(
      () => SignInUseCaseImpl(
        signInRemoteRepository: injector.resolve<SignInRemoteRepository>(),
        localStorageManager: injector.resolve<LocalStorageManager>(),
        getTokenRemoteRepository: injector.resolve<GetTokenRemoteRepository>(),
      ),
    );

    injector.registerFactory<DioManager>(
      () => DioManagerImpl(),
    );
    injector.registerFactory<ConnectionHelper>(() => ConnectionHelperImpl());
    injector.registerFactory(
      () => SignInCubit(
        signInUseCase: injector.resolve<SignInUseCase>(),
        connectionHelper: injector.resolve<ConnectionHelper>(),
      ),
    );

    injector.registerFactory<SignInRemoteRepository>(
      () => SignInRemoteRepositoryImpl(
        baseUrl: injector.resolveByName('baseUrl'),
        apiKey: injector.resolveByName('apiKey'),
        dioManager: injector.resolve<DioManager>(),
      ),
    );

    injector.registerFactory<GetTokenRemoteRepository>(
      () => GetTokenRemoteRepositoryImpl(
        baseUrl: injector.resolveByName('baseUrl'),
        apiKey: injector.resolveByName('apiKey'),
        dioManager: injector.resolve<DioManager>(),
      ),
    );
  }
}
