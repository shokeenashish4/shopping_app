import 'package:figma_shopping_app/generated/assets.dart';
import 'package:figma_shopping_app/ui/screens/onboarding/new_pwd_screen.dart';
import 'package:figma_shopping_app/ui/screens/onboarding_screen_scaffold.dart';
import 'package:flutter/material.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key, required this.email});

  final String email;

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final FocusNode field1FocusNode = FocusNode();
  final FocusNode field2FocusNode = FocusNode();
  final FocusNode field3FocusNode = FocusNode();
  final FocusNode field4FocusNode = FocusNode();

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
            builder: (context) => NewPwdScreen(widget.email),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                children: [
                  VerificationCodeField(
                    inputAction: TextInputAction.next,
                    focusNode: field1FocusNode,
                    onSubmitted: () {
                      field2FocusNode.requestFocus();
                    },
                  ),
                  VerificationCodeField(
                    inputAction: TextInputAction.next,
                    focusNode: field2FocusNode,
                    onSubmitted: () {
                      field3FocusNode.requestFocus();
                    },
                  ),
                  VerificationCodeField(
                    inputAction: TextInputAction.next,
                    focusNode: field3FocusNode,
                    onSubmitted: () {
                      field4FocusNode.requestFocus();
                    },
                  ),
                  VerificationCodeField(
                    inputAction: TextInputAction.done,
                    focusNode: field4FocusNode,
                    onSubmitted: () {
                      field4FocusNode.unfocus();
                    },
                  ),
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
    required this.inputAction,
    required this.focusNode,
    required this.onSubmitted,
  });

  final TextInputAction inputAction;
  final FocusNode focusNode;
  final void Function() onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          focusNode: focusNode,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            enabledBorder: _inputBorder,
            focusedBorder: _inputBorder,
            counterText: "",
          ),
          textInputAction: inputAction,
          keyboardType: TextInputType.number,
          onChanged: (_) {
            onSubmitted();
          },
          maxLength: 1,
        ),
      ),
    );
  }
}

const _inputBorder = OutlineInputBorder();
