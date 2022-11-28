import 'package:flutter/cupertino.dart';

abstract class SnackBarManager {
  Future<void> showSnackbar(
    BuildContext context,
    String message,
    String titleMessage,
    Color color,
    Widget svgAssetManager,
    Color svgColor,
  );
}
