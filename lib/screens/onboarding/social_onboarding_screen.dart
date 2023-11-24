import 'package:figma_shopping_app/generated/assets.dart';
import 'package:figma_shopping_app/screens/onboarding/login_screen.dart';
import 'package:figma_shopping_app/screens/onboarding/signup_onboarding_screen.dart';
import 'package:figma_shopping_app/screens/onboarding_screen_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialOnboardingScreen extends StatelessWidget {
  const SocialOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenScaffold(
      showBackButton: false,
      title: "Let's Get Started",
      lowerText: "Already have an account?",
      lowerTextAction: "Sign in",
      buttonText: "Create an Account",
      onButtonClick: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SignupOnboardingScreen(),
          ),
        );
      },
      onLowerTextActionClick: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
      child: const SocialButtonsSection(),
    );
  }
}

class SocialButtonsSection extends StatelessWidget {
  const SocialButtonsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SocialButton(
          backgroundColor: Color(0xFF4267B2),
          text: "Facebook",
          iconPath: Assets.assetsFacebookLogo,
        ),
        SocialButton(
          backgroundColor: Color(0xFF1DA1F2),
          text: "Twitter",
          iconPath: Assets.assetsTwitterLogo,
        ),
        SocialButton(
          backgroundColor: Color(0xFFEA4335),
          text: "Google",
          iconPath: Assets.assetsGoogleLogo,
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  final Color backgroundColor;
  final String text, iconPath;

  const SocialButton({
    super.key,
    required this.backgroundColor,
    required this.text,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: SvgPicture.asset(iconPath),
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontFamily: "SF-Pro-Text",
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.41,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
