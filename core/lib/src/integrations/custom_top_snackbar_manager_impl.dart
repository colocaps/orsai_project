import 'package:core/src/abstractions/custom_top_snackbar_manager.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CustomTopSnackBarManagerImpl implements CustomTopSnackBarManager {
  @override
  showSuccessTopSnackbar({
    required BuildContext context,
    required String message,
  }) {
    return showTopSnackBar(
      context,
      CustomSnackBar.success(
        message: message,
      ),
    );
  }

  @override
  showErrorTopSnackbar(
    context,
    message,
  ) {
    return showTopSnackBar(
      context,
      CustomSnackBar.error(
        message: message,
      ),
    );
  }

  @override
  showInfoTopSnackbar(
    context,
    message,
  ) {
    return showTopSnackBar(
      context,
      CustomSnackBar.info(
        message: message,
      ),
    );
  }
}
