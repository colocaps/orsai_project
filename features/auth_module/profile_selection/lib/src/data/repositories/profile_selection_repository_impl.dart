import 'package:core/core.dart';
import 'package:profile_selection/src/domain/interactor/input_ouput/profile_selection_output.dart';
import 'package:profile_selection/src/domain/repositories/profile_selection_repository.dart';

class ProfileSelectionRepositoryImpl implements ProfileSelectionRepository {
  @override
  Future<ProfileSelectionOutput> getSelectionItems() async {
    final List<ProfileSelectionEntity> profileEntityList = [];

    ProfileSelectionEntity profileSelectionEntity1 = ProfileSelectionEntity(
      imagePath:
          'https://scontent.fcor17-1.fna.fbcdn.net/v/t1.6435-9/199280580_345469096944687_1072097131842973013_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=e3f864&_nc_eui2=AeG0l9hVfttozGKC4R0HTsr-ad0yf_Ns_zJp3TJ_82z_MuFn0G1qUe7E83VPawQbN9o&_nc_ohc=LKnZy76sjsUAX8LxHeJ&_nc_ht=scontent.fcor17-1.fna&oh=00_AfB8rhgzbBtjJFTyORAp-P2Bhb2X86psvI7ooGwGhE5EJA&oe=63B056EA',
      profileName: 'Soy Veedor',
    );
    ProfileSelectionEntity profileSelectionEntity2 = ProfileSelectionEntity(
      imagePath:
          'https://scontent.fcor17-1.fna.fbcdn.net/v/t1.6435-9/199280580_345469096944687_1072097131842973013_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=e3f864&_nc_eui2=AeG0l9hVfttozGKC4R0HTsr-ad0yf_Ns_zJp3TJ_82z_MuFn0G1qUe7E83VPawQbN9o&_nc_ohc=LKnZy76sjsUAX8LxHeJ&_nc_ht=scontent.fcor17-1.fna&oh=00_AfB8rhgzbBtjJFTyORAp-P2Bhb2X86psvI7ooGwGhE5EJA&oe=63B056EA',
      profileName: 'Soy Jugador',
    );

    ProfileSelectionEntity profileSelectionEntity3 = ProfileSelectionEntity(
      imagePath:
          'https://scontent.fcor17-1.fna.fbcdn.net/v/t1.6435-9/199280580_345469096944687_1072097131842973013_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=e3f864&_nc_eui2=AeG0l9hVfttozGKC4R0HTsr-ad0yf_Ns_zJp3TJ_82z_MuFn0G1qUe7E83VPawQbN9o&_nc_ohc=LKnZy76sjsUAX8LxHeJ&_nc_ht=scontent.fcor17-1.fna&oh=00_AfB8rhgzbBtjJFTyORAp-P2Bhb2X86psvI7ooGwGhE5EJA&oe=63B056EA',
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
