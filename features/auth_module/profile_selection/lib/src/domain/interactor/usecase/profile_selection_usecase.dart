import 'package:profile_selection/src/domain/interactor/input_ouput/profile_selection_output.dart';

abstract class ProfileSelectionUsecase {
  Future<ProfileSelectionOutput> execute();
}
