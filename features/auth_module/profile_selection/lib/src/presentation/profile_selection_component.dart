import 'dart:developer';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/profile_selection_cubit.dart';
import 'cubit/profile_selection_state.dart';
import 'widgets/profile_selection_card.dart';

class ProfileSelectionComponent extends StatelessWidget {
  final ProfileSelectionCubit _profileSelectionCubit;
  final CustomTopSnackBarManager _snackBarManager;
  const ProfileSelectionComponent({
    required ProfileSelectionCubit profileSelectionCubit,
    required CustomTopSnackBarManager snackBarManager,
    super.key,
  })  : _profileSelectionCubit = profileSelectionCubit,
        _snackBarManager = snackBarManager;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _profileSelectionCubit..getProfileData(),
      child: BlocConsumer<ProfileSelectionCubit, ProfileSelectionState>(
        listener: (context, state) {
          if (state is ProfileSelectionConnectionError) {
            _snackBarManager.showErrorTopSnackbar(
              context,
              'Error de conexion, intente mas tarde nuevamente',
            );
          }
        },
        builder: _buildByState,
      ),
    );
  }

  Widget _buildByState(
    BuildContext context,
    ProfileSelectionState state,
  ) {
    if (state is ProfileSelectionLoading) {
      return const LoadingIndicator();
    } else if (state is ProfileSelectionLoaded) {
      final List<ProfileSelectionEntity> profileSelectionEntityList =
          state.selectionProfileEnityList;
      return Container(
        padding: const EdgeInsets.only(top: 15),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              child: Text(
                'Seleccione su perfil',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.separated(
                    itemCount: profileSelectionEntityList.length,
                    itemBuilder: (context, index) {
                      return ProfileSelectionCard(
                        profileSelectionEntity:
                            profileSelectionEntityList[index],
                        onTap: () {
                          log(profileSelectionEntityList[index].profileName);
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 25,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
    return Container();
  }
}
