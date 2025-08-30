import 'package:flutter/material.dart';

// 앱 전역에서 사용하는 색상 모음 (ThemeExtension)
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.surface,
    required this.surfaceDark,
    required this.grey100,
    required this.grey300,
    required this.grey700,
    required this.grey800,
    required this.mutedText,
    required this.buttonDisabledBg,
    required this.buttonDisabledText,
    required this.border,
  });

  final Color surface; // light surface (white)
  final Color surfaceDark; // dark surface
  final Color grey100;
  final Color grey300;
  final Color grey700;
  final Color grey800;
  final Color mutedText;
  final Color buttonDisabledBg;
  final Color buttonDisabledText;
  final Color border;

  static const AppColors light = AppColors(
    surface: Colors.white,
    surfaceDark: Colors.black,
    grey100: Color(0xFFF5F5F5),
    grey300: Color(0xFFD6D6D6),
    grey700: Color(0xFF616161),
    grey800: Color(0xFF424242),
    mutedText: Color(0xFF6B7280),
    buttonDisabledBg: Color(0xFFD6D6D6),
    buttonDisabledText: Color(0xFF9E9E9E),
    border: Color(0xFFD6D6D6),
  );

  static const AppColors dark = AppColors(
    surface: Colors.black,
    surfaceDark: Colors.white,
    grey100: Color(0xFF0F0F0F),
    grey300: Color(0xFF303030),
    grey700: Color(0xFF9E9E9E),
    grey800: Color(0xFFBDBDBD),
    mutedText: Color(0xFFBDBDBD),
    buttonDisabledBg: Color(0xFF303030),
    buttonDisabledText: Color(0xFF757575),
    border: Color(0xFF303030),
  );

  @override
  AppColors copyWith({
    Color? surface,
    Color? surfaceDark,
    Color? grey100,
    Color? grey300,
    Color? grey700,
    Color? grey800,
    Color? mutedText,
    Color? buttonDisabledBg,
    Color? buttonDisabledText,
    Color? border,
  }) {
    return AppColors(
      surface: surface ?? this.surface,
      surfaceDark: surfaceDark ?? this.surfaceDark,
      grey100: grey100 ?? this.grey100,
      grey300: grey300 ?? this.grey300,
      grey700: grey700 ?? this.grey700,
      grey800: grey800 ?? this.grey800,
      mutedText: mutedText ?? this.mutedText,
      buttonDisabledBg: buttonDisabledBg ?? this.buttonDisabledBg,
      buttonDisabledText: buttonDisabledText ?? this.buttonDisabledText,
      border: border ?? this.border,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceDark: Color.lerp(surfaceDark, other.surfaceDark, t)!,
      grey100: Color.lerp(grey100, other.grey100, t)!,
      grey300: Color.lerp(grey300, other.grey300, t)!,
      grey700: Color.lerp(grey700, other.grey700, t)!,
      grey800: Color.lerp(grey800, other.grey800, t)!,
      mutedText: Color.lerp(mutedText, other.mutedText, t)!,
      buttonDisabledBg:
          Color.lerp(buttonDisabledBg, other.buttonDisabledBg, t)!,
      buttonDisabledText:
          Color.lerp(buttonDisabledText, other.buttonDisabledText, t)!,
      border: Color.lerp(border, other.border, t)!,
    );
  }
}
