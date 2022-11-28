import 'package:flutter/material.dart';

abstract class BottomSheetDialogManager {
  Future<void> showBottomSheetDialog(
    BuildContext context,
    Widget Function(BuildContext) builder,
  );
}
