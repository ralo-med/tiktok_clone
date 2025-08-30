import 'package:flutter/material.dart';

import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';

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
        textTheme: Typography.whiteMountainView,
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        primaryColor: const Color(0xFFFE2C55),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      darkTheme: ThemeData(
        textTheme: Typography.whiteMountainView,
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFE2C55),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      home: const SignUpScreen(),
    );
  }
}
