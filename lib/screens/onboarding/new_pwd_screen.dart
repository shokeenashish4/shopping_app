import 'package:figma_shopping_app/screens/cart_screen.dart';
import 'package:figma_shopping_app/screens/onboarding/signup_onboarding_screen.dart';
import 'package:figma_shopping_app/screens/onboarding_screen_scaffold.dart';
import 'package:flutter/material.dart';

class NewPwdScreen extends StatelessWidget {
  const NewPwdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenScaffold(
      title: "New Password",
      lowerText: "Please write your new Password",
      lowerTextAction: "",
      buttonText: "Reset Password",
      onButtonClick: () {
        //TODO: abhi ye CartScreen pe ja rha h, isko thik krna h baad me
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CartScreen(),
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "New Password",
                labelStyle: labelTextStyle,
                enabledBorder: textFieldBorder,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Confirm Password",
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
