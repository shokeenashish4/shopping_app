import 'package:figma_shopping_app/data/auth_repository.dart';
import 'package:figma_shopping_app/di.dart';
import 'package:figma_shopping_app/ui/screens/gender_screen.dart';
import 'package:figma_shopping_app/ui/screens/onboarding/signup_onboarding_screen.dart';
import 'package:figma_shopping_app/ui/screens/onboarding_screen_scaffold.dart';
import 'package:flutter/material.dart';

class NewPwdScreen extends StatefulWidget {
  const NewPwdScreen(
    this.email, {
    super.key,
  });

  final String email;

  @override
  State<NewPwdScreen> createState() => _NewPwdScreenState();
}

class _NewPwdScreenState extends State<NewPwdScreen> {
  final passwordController = TextEditingController();

  final authRepo = di<AuthRepository>();
  bool showErrorMessage = false;
  bool? isEmailCorrect, isPasswordCorrect;

  void resetStates() {
    showErrorMessage = false;
    isEmailCorrect = null;
    isPasswordCorrect = null;
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenScaffold(
      title: "New Password",
      lowerText: "Please write your new Password",
      lowerTextAction: "",
      buttonText: "Reset Password",
      onButtonClick: () {
        final resetPasswordResponse = authRepo.resetPassword(
          email: widget.email,
          password: passwordController.text,
        );

        resetPasswordResponse.then(
          (wasLoggedIn) {
            Future.delayed(
              const Duration(seconds: 2),
              () {
                if (wasLoggedIn) {
                  const Center(child: CircularProgressIndicator());
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const GenderScreen(),
                    ),
                  );
                } else {
                  setState(
                    () {
                      isPasswordCorrect = false;
                      isEmailCorrect = false;
                      showErrorMessage = true;
                    },
                  );
                }
              },
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "New Password",
                labelStyle: labelTextStyle,
                enabledBorder: textFieldBorder,
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Confirm Password",
                labelStyle: labelTextStyle,
                enabledBorder: textFieldBorder,
              ),
            ),
            if (showErrorMessage)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Password Reset failed! Please check your entered Credentials",
                  style: TextStyle(color: Colors.red, fontSize: 17),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
