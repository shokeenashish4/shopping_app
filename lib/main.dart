import 'package:figma_shopping_app/screens/onboarding/social_onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Inter",
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF9775FA),
          secondary: Color(0xFF4BC76D),
          background: Color(0xFFFEFEFE),
          onBackground: Color(0xFF1D1E20),
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: "Inter",
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF9775FA),
          secondary: Color(0xFF34C759),
          background: Color(0xFF1B262C),
          onBackground: Color(0xFFFFFFFF),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const Scaffold(
        body: SocialOnboardingScreen(),
      ),
    );
  }
}
