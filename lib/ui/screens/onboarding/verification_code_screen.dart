import 'package:figma_shopping_app/generated/assets.dart';
import 'package:figma_shopping_app/ui/screens/onboarding/new_pwd_screen.dart';
import 'package:figma_shopping_app/ui/screens/onboarding_screen_scaffold.dart';
import 'package:flutter/material.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenScaffold(
      title: "Verification Code",
      lowerText: "Resend Confirmation Code",
      showLowerTextActionInLeft: true,
      lowerTextAction: "00:10 ",
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
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Image.asset(Assets.assetsForgotPwdCloud),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Row(
                children: [
                  VerificationCodeField(),
                  VerificationCodeField(),
                  VerificationCodeField(),
                  VerificationCodeField(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerificationCodeField extends StatelessWidget {
  const VerificationCodeField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Flexible(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          readOnly: true,
          decoration: InputDecoration(
            enabledBorder: _inputBorder,
            focusedBorder: _inputBorder,
          ),
        ),
      ),
    );
  }
}

const _inputBorder = OutlineInputBorder();
