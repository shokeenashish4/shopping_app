import 'package:figma_shopping_app/generated/assets.dart';
import 'package:figma_shopping_app/screens/onboarding/signup_onboarding_screen.dart';
import 'package:figma_shopping_app/screens/onboarding/verification_code_screen.dart';
import 'package:figma_shopping_app/screens/onboarding_screen_scaffold.dart';
import 'package:flutter/material.dart';

class ForgotPwdScreen extends StatelessWidget {
  const ForgotPwdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenScaffold(
      title: "Forgot Password",
      lowerTextAction: "",
      lowerText:
          "Please write your E-mail to receive a confirmation code to set a new Password",
      buttonText: "Confirm Mail",
      onButtonClick: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const VerificationCodeScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Image.asset(Assets.assetsForgotPwdCloud),
            const TextField(
              decoration: InputDecoration(
                labelText: "E-mail Address",
                labelStyle: labelTextStyle,
                enabledBorder: textFieldBorder,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
