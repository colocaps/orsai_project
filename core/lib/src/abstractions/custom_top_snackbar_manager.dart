import 'package:flutter/material.dart';

abstract class CustomTopSnackBarManager {
  void showSuccessTopSnackbar({
    required BuildContext context,
    required String message,
  });
  void showInfoTopSnackbar(
    BuildContext context,
    String message,
  );
  void showErrorTopSnackbar(
    BuildContext context,
    String message,
  );
}
