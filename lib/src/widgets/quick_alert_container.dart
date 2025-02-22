import 'package:flutter/material.dart';
import 'package:flutter_quickalert/flutter_quickalert.dart';
import 'package:flutter_quickalert/src/widgets/dots_animation.dart';

/// A container widget for displaying quick alerts.
class QuickAlertContainer extends StatelessWidget {
  /// The message to display in the alert.
  final String message;

  /// The type of the alert.
  final QuickAlertTypes type;

  /// The dialog type of the alert.
  final QuickAlertDialogTypes dialogType;

  /// Whether to show the close button.
  final bool showCloseButton;

  /// Whether to show the cancel button.
  final bool showCancelButton;

  /// Callback function when loading is canceled.
  final void Function(BuildContext context)? onCanceled;

  /// Creates a [QuickAlertContainer].
  const QuickAlertContainer({
    super.key,
    required this.message,
    required this.type,
    required this.dialogType,
    required this.showCloseButton,
    required this.showCancelButton,
    this.onCanceled,
  });

  @override
  Widget build(BuildContext context) {
    var theme =
        Theme.of(context).extension<QuickAlertTheme>() ?? QuickAlertTheme();
    var color = _getColor(type, theme);
    var onColor = _getOnColor(type, theme);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(theme.radius),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.symmetric(vertical: 8),
      contentPadding: EdgeInsets.zero,
      backgroundColor: theme.background,
      actions: [
        if (dialogType == QuickAlertDialogTypes.loading &&
            showCancelButton == false) ...{
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop(false);
              if (onCanceled != null) {
                onCanceled!(context);
              }
            },
            style: FilledButton.styleFrom(
              backgroundColor: color,
              foregroundColor: onColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(theme.radius),
              ),
            ),
            child: Text(
              _getCancelText(context),
              style: TextStyle(color: onColor),
            ),
          ),
        },

        if (dialogType == QuickAlertDialogTypes.confirm &&
            showCancelButton == false) ...{
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: onColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(theme.radius),
              ),
              side: BorderSide(color: color),
            ),
            child: Text(
              _getCancelText(context),
              style: TextStyle(color: color),
            ),
          ),
        },
        if (showCloseButton && dialogType != QuickAlertDialogTypes.loading) ...{
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            style: FilledButton.styleFrom(
              backgroundColor: color,
              foregroundColor: onColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(theme.radius),
              ),
            ),
            child: Text(
              _getButtonText(dialogType, context),
              style: TextStyle(color: onColor),
            ),
          ),
        },
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(theme.radius),
              ),
            ),
            child: Center(
              child:
                  dialogType == QuickAlertDialogTypes.loading
                      ? DotsAnimation(color: onColor)
                      : Icon(_getIcon(type), color: onColor, size: 56),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: theme.onBackground),
            ),
          ),
        ],
      ),
    );
  }
}

/// Returns the color based on the alert type and theme.
Color _getColor(QuickAlertTypes type, QuickAlertTheme theme) {
  switch (type) {
    case QuickAlertTypes.error:
      return theme.error;
    case QuickAlertTypes.warning:
      return theme.warning;
    case QuickAlertTypes.info:
      return theme.info;
    default:
      return theme.success;
  }
}

/// Returns the on-color based on the alert type and theme.
Color _getOnColor(QuickAlertTypes type, QuickAlertTheme theme) {
  switch (type) {
    case QuickAlertTypes.error:
      return theme.onError;
    case QuickAlertTypes.warning:
      return theme.onWarning;
    case QuickAlertTypes.info:
      return theme.onInfo;
    default:
      return theme.onSuccess;
  }
}

/// Returns the icon based on the alert type.
IconData _getIcon(QuickAlertTypes type) {
  switch (type) {
    case QuickAlertTypes.error:
      return Icons.cancel;
    case QuickAlertTypes.warning:
      return Icons.warning;
    case QuickAlertTypes.info:
      return Icons.info;
    default:
      return Icons.check_circle;
  }
}

/// Returns the button text based on the dialog type and context.
String _getButtonText(QuickAlertDialogTypes dialogType, BuildContext context) {
  switch (dialogType) {
    case QuickAlertDialogTypes.confirm:
      return _confirmTexts[_getLanuageCode(context)] ?? _confirmTexts['en']!;
    default:
      return _closeTexts[_getLanuageCode(context)] ?? _closeTexts['en']!;
  }
}

/// Returns the cancel text based on the context.
String _getCancelText(BuildContext context) {
  return _cancelTexts[_getLanuageCode(context)] ?? _cancelTexts['en']!;
}

/// Returns the language code based on the context.
String _getLanuageCode(BuildContext context) {
  return Localizations.localeOf(context).languageCode;
}

/// A map of close button texts in different languages.
Map<String, String> get _closeTexts => {
  'en': 'Close',
  'ar': 'اغلاق',
  'ckb': 'داخستن',
  'af': 'Maak toe',
  'sq': 'Mbyll',
  'be': 'Закрыць',
  'bg': 'Затвори',
  'ca': 'Tanca',
  'zh': '关闭',
  'hr': 'Zatvori',
  'cs': 'Zavřít',
  'da': 'Luk',
  'nl': 'Sluiten',
  'et': 'Sulge',
  'fi': 'Sulje',
  'fr': 'Fermer',
  'de': 'Schließen',
  'el': 'Κλείσιμο',
  'hi': 'बंद करें',
  'hu': 'Bezárás',
  'is': 'Loka',
  'id': 'Tutup',
  'it': 'Chiudi',
  'ja': '閉じる',
  'ko': '닫기',
  'lv': 'Aizvērt',
  'lt': 'Uždaryti',
  'mk': 'Затвори',
  'ms': 'Tutup',
  'no': 'Lukk',
  'pl': 'Zamknij',
  'pt': 'Fechar',
  'ro': 'Închide',
  'ru': 'Закрыть',
  'sr': 'Затвори',
  'sk': 'Zavrieť',
  'sl': 'Zapri',
  'es': 'Cerrar',
  'sv': 'Stäng',
  'th': 'ปิด',
  'tr': 'Kapat',
  'uk': 'Закрити',
  'vi': 'Đóng',
};

/// A map of cancel button texts in different languages.
Map<String, String> get _cancelTexts => {
  'en': 'Cancel',
  'ar': 'إلغاء',
  'ckb': 'بەردەوام نەبە',
  'af': 'Kanselleer',
  'sq': 'Anulo',
  'be': 'Адмяніць',
  'bg': 'Отказ',
  'ca': 'Cancel·la',
  'zh': '取消',
  'hr': 'Otkaži',
  'cs': 'Zrušit',
  'da': 'Annuller',
  'nl': 'Annuleren',
  'et': 'Tühista',
  'fi': 'Peruuta',
  'fr': 'Annuler',
  'de': 'Abbrechen',
  'el': 'Ακύρωση',
  'hi': 'रद्द करें',
  'hu': 'Mégse',
  'is': 'Hætta við',
  'id': 'Batal',
  'it': 'Annulla',
  'ja': 'キャンセル',
  'ko': '취소',
  'lv': 'Atcelt',
  'lt': 'Atšaukti',
  'mk': 'Откажи',
  'ms': 'Batal',
  'no': 'Avbryt',
  'pl': 'Anuluj',
  'pt': 'Cancelar',
  'ro': 'Anulează',
  'ru': 'Отмена',
  'sr': 'Откажи',
  'sk': 'Zrušiť',
  'sl': 'Prekliči',
  'es': 'Cancelar',
  'sv': 'Avbryt',
  'th': 'ยกเลิก',
  'tr': 'İptal',
  'uk': 'Скасувати',
  'vi': 'Hủy',
};

/// A map of confirm button texts in different languages.
Map<String, String> get _confirmTexts => {
  'en': 'Confirm',
  'ar': 'تأكيد',
  'ckb': 'پەسەندکردن',
  'af': 'Bevestig',
  'sq': 'Konfirmo',
  'be': 'Пацвердзіць',
  'bg': 'Потвърди',
  'ca': 'Confirma',
  'zh': '确认',
  'hr': 'Potvrdi',
  'cs': 'Potvrdit',
  'da': 'Bekræft',
  'nl': 'Bevestigen',
  'et': 'Kinnita',
  'fi': 'Vahvista',
  'fr': 'Confirmer',
  'de': 'Bestätigen',
  'el': 'Επιβεβαίωση',
  'hi': 'पुष्टि करें',
  'hu': 'Megerősít',
  'is': 'Staðfesta',
  'id': 'Konfirmasi',
  'it': 'Conferma',
  'ja': '確認',
  'ko': '확인',
  'lv': 'Apstiprināt',
  'lt': 'Patvirtinti',
  'mk': 'Потврди',
  'ms': 'Sahkan',
  'no': 'Bekreft',
  'pl': 'Potwierdź',
  'pt': 'Confirmar',
  'ro': 'Confirmă',
  'ru': 'Подтвердить',
  'sr': 'Потврди',
  'sk': 'Potvrdiť',
  'sl': 'Potrdi',
  'es': 'Confirmar',
  'sv': 'Bekräfta',
  'th': 'ยืนยัน',
  'tr': 'Onayla',
  'uk': 'Підтвердити',
  'vi': 'Xác nhận',
};
