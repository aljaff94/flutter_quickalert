import 'package:flutter/material.dart';
import 'package:flutter_quickalert/flutter_quickalert.dart';
import 'package:flutter_quickalert/src/widgets/quick_alert_container.dart';

/// A dialog that displays a quick alert.
class QuickAlert {
  QuickAlert._();

  /// Displays a quick alert dialog.
  ///
  /// [context] is the build context.
  /// [message] is the message to be displayed in the dialog.
  /// [type] is the type of the alert.
  /// [dialogType] is the type of the dialog, defaults to [QuickAlertDialogType.normal].
  /// [showCloseButton] determines if the close button should be shown, defaults to true.
  /// [showCancelButton] determines if the cancel button should be shown, defaults to false.
  /// [barrierDismissible] determines if the dialog can be dismissed by tapping outside, defaults to false.
  /// [onLoadingCanceled] is a callback function that is called when loading is canceled.
  static Future<bool?> show({
    required BuildContext context,
    required String message,
    required QuickAlertTypes type,
    QuickAlertDialogTypes dialogType = QuickAlertDialogTypes.normal,
    bool showCloseButton = true,
    bool showCancelButton = false,
    bool barrierDismissible = false,
    void Function(BuildContext context)? onCanceled,
  }) {
    if (showCloseButton == false) {
      barrierDismissible = true;
    }
    return showGeneralDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      pageBuilder:
          (context, animation, secondaryAnimation) => QuickAlertContainer(
            message: message,
            type: type,
            dialogType: dialogType,
            showCloseButton: showCloseButton,
            showCancelButton: showCancelButton,
            onCanceled: onCanceled,
          ),
    );
  }
}
