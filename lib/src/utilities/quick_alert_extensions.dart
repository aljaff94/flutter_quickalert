import 'package:flutter/material.dart';
import 'package:flutter_quickalert/flutter_quickalert.dart';
import 'package:flutter_quickalert/src/widgets/quick_alert_container.dart';

/// Extension on [BuildContext] to show different types of alerts.
extension QuickAlertExtensions on BuildContext {
  /// Shows a normal alert dialog.
  ///
  /// [message] is the message to be displayed in the alert.
  /// [type] is the type of the alert.
  /// [showCloseButton] determines if the close button should be shown.
  /// [showCancelButton] determines if the cancel button should be shown.
  /// [barrierDismissible] determines if the dialog can be dismissed by tapping outside.
  Future<bool?> showAlert({
    required String message,
    required QuickAlertTypes type,
    bool showCloseButton = true,
    bool showCancelButton = false,
    bool barrierDismissible = false,
  }) {
    if (showCloseButton == false) {
      barrierDismissible = true;
    }
    return showGeneralDialog(
      context: this,
      barrierDismissible: barrierDismissible,
      pageBuilder:
          (context, animation, secondaryAnimation) => QuickAlertContainer(
            message: message,
            type: type,
            dialogType: QuickAlertDialogTypes.normal,
            showCloseButton: showCloseButton,
            showCancelButton: showCancelButton,
          ),
    );
  }

  /// Shows a loading alert dialog.
  ///
  /// [message] is the message to be displayed in the alert.
  /// [type] is the type of the alert.
  /// [showCancelButton] determines if the cancel button should be shown.
  /// [onCanceled] is the callback function to be called when the alert is canceled.
  Future<bool?> showLoadingAlert({
    required String message,
    required QuickAlertTypes type,
    final bool showCancelButton = true,
    void Function(BuildContext context)? onCanceled,
  }) {
    return showGeneralDialog(
      context: this,
      barrierDismissible: false,
      pageBuilder:
          (context, animation, secondaryAnimation) => QuickAlertContainer(
            message: message,
            type: type,
            dialogType: QuickAlertDialogTypes.loading,
            showCloseButton: false,
            showCancelButton: showCancelButton,
            onCanceled: onCanceled,
          ),
    );
  }

  /// Shows a confirm alert dialog.
  ///
  /// [message] is the message to be displayed in the alert.
  /// [type] is the type of the alert.
  Future<bool?> showConfirmAlert({
    required String message,
    required QuickAlertTypes type,
  }) {
    return showGeneralDialog(
      context: this,
      barrierDismissible: false,
      pageBuilder:
          (context, animation, secondaryAnimation) => QuickAlertContainer(
            message: message,
            type: type,
            dialogType: QuickAlertDialogTypes.confirm,
            showCloseButton: true,
            showCancelButton: true,
          ),
    );
  }
}
