import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:profile_selection/profile_selection.dart';

class ProfileSelectionPage extends StatelessWidget {
  const ProfileSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    var profileSelectionCubit =
        InjectorContainer.instance.resolve<ProfileSelectionCubit>();
    var snackBarManager =
        InjectorContainer.instance.resolve<CustomTopSnackBarManager>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Orsai App'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: ProfileSelectionComponent(
            profileSelectionCubit: profileSelectionCubit,
            snackBarManager: snackBarManager,
          ),
        ),
      ),
    );
  }
}
