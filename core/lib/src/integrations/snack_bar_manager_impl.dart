import 'package:core/src/abstractions/snack_bar_manager.dart';
import 'package:core/src/widgets/custom_floating_snackbar.dart';
import 'package:flutter/material.dart';

class SnackBarManagerImpl implements SnackBarManager {
  @override
  Future<void> showSnackbar(
    BuildContext context,
    String message,
    String titleMessage,
    Color color,
    dynamic svgAssetManager,
    Color sgvColor,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomFloatingSnackBar(
          svgAssetsManager: svgAssetManager,
          message: message,
          titleMessage: titleMessage,
          color: color,
          sgvColor: sgvColor,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );

    return Future.value();
  }
}
