import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_selection/src/domain/interactor/usecase/profile_selection_usecase.dart';
import 'package:profile_selection/src/presentation/cubit/profile_selection_state.dart';

class ProfileSelectionCubit extends Cubit<ProfileSelectionState> {
  final ProfileSelectionUsecase _profileSelectionUsecase;
  final ConnectionHelper _connectionHelper;
  ProfileSelectionCubit({
    required ProfileSelectionUsecase profileSelectionUsecase,
    required ConnectionHelper connectionHelper,
  })  : _profileSelectionUsecase = profileSelectionUsecase,
        _connectionHelper = connectionHelper,
        super(ProfileSelectionInitial());

  Future<void> getProfileData() async {
    emit(ProfileSelectionLoading());
    Future.delayed(const Duration(seconds: 4), () async {
      if (await isNotConnected()) {
        emit(
          ProfileSelectionConnectionError(),
        );
        return;
      }

      var result = await _profileSelectionUsecase.execute();
      if (result.hasErrors) {
        emit(
          ProfileSelectionError(result.errors!),
        );
      } else {
        emit(
          ProfileSelectionLoaded(result.profileSelectionEntity!),
        );
      }
    });
  }

  Future<bool> isNotConnected() async => !await _connectionHelper.isConnected();
}
