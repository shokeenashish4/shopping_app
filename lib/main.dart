import 'package:figma_shopping_app/data/auth_repository.dart';
import 'package:figma_shopping_app/di.dart';
import 'package:figma_shopping_app/ui/screens/dashboard_screen.dart';
import 'package:figma_shopping_app/ui/screens/onboarding/social_onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  setupDependencyInjection();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final authRepo = di<AuthRepository>();

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
      home: Scaffold(
        body: authRepo.isUserLoggedIn()
            ? const DashboardScreen()
            : const SocialOnboardingScreen(),
      ),
    );
  }
}
