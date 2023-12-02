import 'package:figma_shopping_app/screens/onboarding_screen_scaffold.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenScaffold(
      buttonText: "Save Address",
      onButtonClick: () {},
      child: const Column(
        children: [],
      ),
    );
  }
}
