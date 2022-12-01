import 'package:core/core.dart';
import 'package:profile_selection/src/data/repositories/profile_selection_repository_impl.dart';
import 'package:profile_selection/src/domain/interactor/usecase/profile_selection_usecase.dart';
import 'package:profile_selection/src/domain/interactor/usecase/profile_selection_usecase_impl.dart';
import 'package:profile_selection/src/domain/repositories/profile_selection_repository.dart';
import 'package:profile_selection/src/presentation/cubit/profile_selection_cubit.dart';

abstract class ProfileSelectionInitializer {
  static registerDependencies() {
    var injector = InjectorContainer.instance;

    injector.registerFactory<ProfileSelectionUsecase>(
      () => ProfileSelectionUsecaseImpl(
        profileSelectionRepository:
            injector.resolve<ProfileSelectionRepository>(),
      ),
    );

    injector.registerFactory<DioManager>(
      () => DioManagerImpl(),
    );

    injector.registerFactory(
      () => ProfileSelectionCubit(
        profileSelectionUsecase: injector.resolve<ProfileSelectionUsecase>(),
        connectionHelper: injector.resolve<ConnectionHelper>(),
      ),
    );

    injector.registerFactory<ProfileSelectionRepository>(
      () => ProfileSelectionRepositoryImpl(),
    );
  }
}
