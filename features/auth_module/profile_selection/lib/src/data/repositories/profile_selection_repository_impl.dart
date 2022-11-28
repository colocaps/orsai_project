import 'package:core/core.dart';
import 'package:profile_selection/src/domain/interactor/input_ouput/profile_selection_output.dart';
import 'package:profile_selection/src/domain/repositories/profile_selection_repository.dart';

class ProfileSelectionRepositoryImpl implements ProfileSelectionRepository {
  @override
  Future<ProfileSelectionOutput> getSelectionItems() async {
    final List<ProfileSelectionEntity> profileEntityList = [];

    ProfileSelectionEntity profileSelectionEntity1 = ProfileSelectionEntity(
      imagePath: 'assets/images/no-image.jpg',
      profileName: 'Soy Veedor',
    );
    ProfileSelectionEntity profileSelectionEntity2 = ProfileSelectionEntity(
      imagePath: 'assets/images/no-image.jpg',
      profileName: 'Soy Jugador',
    );

    ProfileSelectionEntity profileSelectionEntity3 = ProfileSelectionEntity(
      imagePath: 'assets/images/no-image.jpg',
      profileName: 'Soy Delegado',
    );

    profileEntityList.addAll(
      [
        profileSelectionEntity1,
        profileSelectionEntity2,
        profileSelectionEntity3,
      ],
    );

    return ProfileSelectionOutput.withData(
        profileSelectionEntity: profileEntityList);
  }
}
