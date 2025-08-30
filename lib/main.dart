import 'package:flutter/material.dart';

import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/theme.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        textTheme: Typography.blackMountainView,
        scaffoldBackgroundColor: AppColors.light.surface,
        brightness: Brightness.light,
        primaryColor: const Color(0xFFFE2C55),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        extensions: const <ThemeExtension<dynamic>>[AppColors.light],
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFFE2C55),
        ),
      ),
      darkTheme: ThemeData(
        textTheme: Typography.whiteMountainView,
        scaffoldBackgroundColor: AppColors.dark.surface,
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFE2C55),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        extensions: const <ThemeExtension<dynamic>>[AppColors.dark],
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFFE2C55),
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}
