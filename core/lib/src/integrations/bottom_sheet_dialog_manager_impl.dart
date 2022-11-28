import 'package:core/src/abstractions/bottom_sheet_dialog_manager.dart';
import 'package:flutter/material.dart';

class BottomSheetDialogManagerImpl implements BottomSheetDialogManager {
  @override
  Future<void> showBottomSheetDialog(
    BuildContext context,
    Widget Function(BuildContext) builder,
  ) {
    return showModalBottomSheet<void>(
      context: context,
      builder: builder,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.white,
    );
  }
}
