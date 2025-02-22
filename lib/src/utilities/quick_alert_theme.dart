import 'dart:ui';

import 'package:flutter/material.dart';

/// A custom theme extension for QuickAlert.
class QuickAlertTheme extends ThemeExtension<QuickAlertTheme> {
  /// Colors for different alert types.
  final Color success,
      onSuccess,
      error,
      onError,
      warning,
      onWarning,
      info,
      onInfo;

  /// Optional background and onBackground colors.
  final Color? background, onBackground;

  /// Border radius for the alert.
  final double radius;

  /// Creates a QuickAlertTheme.
  QuickAlertTheme({
    this.background,
    this.onBackground,
    this.success = const Color(0xFF569F49),
    this.onSuccess = Colors.white,
    this.error = const Color(0xFFAA4444),
    this.onError = Colors.white,
    this.warning = const Color(0xFFE69A00),
    this.onWarning = Colors.white,
    this.info = const Color(0xFF258EA6),
    this.onInfo = Colors.white,
    this.radius = 8,
  });

  /// Creates a copy of this theme but with the given fields replaced with the new values.
  @override
  ThemeExtension<QuickAlertTheme> copyWith({
    Color? background,
    Color? onBackground,
    Color? success,
    Color? onSuccess,
    Color? error,
    Color? onError,
    Color? warning,
    Color? onWarning,
    Color? info,
    Color? onInfo,
    double? radius,
  }) {
    return QuickAlertTheme(
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      radius: radius ?? this.radius,
    );
  }

  /// Linearly interpolate between two QuickAlertThemes.
  @override
  ThemeExtension<QuickAlertTheme> lerp(QuickAlertTheme other, double t) {
    return QuickAlertTheme(
      background: Color.lerp(background, other.background, t),
      onBackground: Color.lerp(onBackground, other.onBackground, t),
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      radius: lerpDouble(radius, other.radius, t)!,
    );
  }
}
