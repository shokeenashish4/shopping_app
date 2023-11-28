import 'package:figma_shopping_app/generated/assets.dart';
import 'package:figma_shopping_app/screens/onboarding/new_pwd_screen.dart';
import 'package:figma_shopping_app/screens/onboarding_screen_scaffold.dart';
import 'package:flutter/material.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenScaffold(
      title: "Verification Code",
      lowerText: "Resend Confirmation Code",
      lowerTextAction: "00:10",
      buttonText: "Confirm Code",
      onButtonClick: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const NewPwdScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Image.asset(Assets.assetsForgotPwdCloud),
          ],
        ),
      ),
    );
  }
}
