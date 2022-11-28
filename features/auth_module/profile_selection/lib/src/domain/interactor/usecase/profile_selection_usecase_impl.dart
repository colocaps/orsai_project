import 'package:profile_selection/src/domain/interactor/input_ouput/profile_selection_output.dart';
import 'package:profile_selection/src/domain/repositories/profile_selection_repository.dart';

import 'profile_selection_usecase.dart';

class ProfileSelectionUsecaseImpl implements ProfileSelectionUsecase {
  final ProfileSelectionRepository _profileSelectionRepository;

  ProfileSelectionUsecaseImpl({
    required ProfileSelectionRepository profileSelectionRepository,
  }) : _profileSelectionRepository = profileSelectionRepository;

  @override
  Future<ProfileSelectionOutput> execute() async {
    final response = await _profileSelectionRepository.getSelectionItems();

    if (response.hasErrors) {
      return ProfileSelectionOutput.withErrors(
        errors: response.errors,
      );
    } else {
      return ProfileSelectionOutput.withData(
        profileSelectionEntity: response.profileSelectionEntity,
      );
    }
  }
}
