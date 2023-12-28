import 'package:figma_shopping_app/generated/assets.dart';
import 'package:figma_shopping_app/ui/screens/onboarding/signup_onboarding_screen.dart';
import 'package:figma_shopping_app/ui/screens/onboarding/verification_code_screen.dart';
import 'package:figma_shopping_app/ui/screens/onboarding_screen_scaffold.dart';
import 'package:flutter/material.dart';

class ForgotPwdScreen extends StatefulWidget {
  const ForgotPwdScreen({
    super.key,
  });

  @override
  State<ForgotPwdScreen> createState() => _ForgotPwdScreenState();
}

class _ForgotPwdScreenState extends State<ForgotPwdScreen> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenScaffold(
      title: "Forgot Password",
      lowerText:
          "Please write your E-mail to receive a confirmation code to set a new Password",
      lowerTextPadding: const EdgeInsets.all(32),
      buttonText: "Confirm Mail",
      onButtonClick: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                VerificationCodeScreen(email: emailController.text),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 68),
              child: Image.asset(Assets.assetsForgotPwdCloud),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 72),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "E-mail Address",
                  labelStyle: labelTextStyle,
                  enabledBorder: textFieldBorder,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
