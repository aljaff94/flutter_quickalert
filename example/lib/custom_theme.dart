import 'package:flutter/material.dart';
import 'package:flutter_quickalert/flutter_quickalert.dart';

class CustomTheme {
  CustomTheme._();

  static ThemeData get theme => ThemeData(
    // your custom theme data
    extensions: <ThemeExtension<dynamic>>{
      QuickAlertTheme(
        // background,
        // onBackground,
        success: const Color(0xFF569F49),
        onSuccess: Colors.white,
        error: const Color(0xFFAA4444),
        onError: Colors.white,
        warning: const Color(0xFFE69A00),
        onWarning: Colors.white,
        info: const Color(0xFF258EA6),
        onInfo: Colors.white,
        radius: 8,
        headerHeight: 100,
      ),
    },
  );
}
