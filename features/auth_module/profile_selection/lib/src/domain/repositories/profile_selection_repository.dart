import 'package:profile_selection/src/domain/interactor/input_ouput/profile_selection_output.dart';

abstract class ProfileSelectionRepository {
  Future<ProfileSelectionOutput> getSelectionItems();
}
