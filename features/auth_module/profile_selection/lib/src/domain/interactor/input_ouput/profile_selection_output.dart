import 'package:core/core.dart';

class ProfileSelectionOutput {
  final List<ProfileSelectionEntity>? profileSelectionEntity;
  late List<String>? errors = [];

  ProfileSelectionOutput.withData({
    required this.profileSelectionEntity,
  });

  ProfileSelectionOutput.withErrors({
    required this.errors,
    this.profileSelectionEntity,
  });

  bool get hasErrors => errors?.isNotEmpty ?? false;
}
