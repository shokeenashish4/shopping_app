import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:figma_shopping_app/generated/assets.dart';
import 'package:figma_shopping_app/ui/colors.dart';
import 'package:figma_shopping_app/ui/screens/onboarding_screen_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupOnboardingScreen extends StatelessWidget {
  const SignupOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenScaffold(
      title: "Sign Up",
      buttonText: "Sign Up",
      onButtonClick: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Username",
                labelStyle: labelTextStyle,
                enabledBorder: textFieldBorder,
                suffixIconConstraints: const BoxConstraints(),
                suffixIcon: SvgPicture.asset(
                  Assets.assetsCheckIcon,
                  alignment: Alignment.bottomCenter,
                  width: 10,
                  height: 10,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: labelTextStyle,
                enabledBorder: textFieldBorder,
                suffixIconConstraints: const BoxConstraints(),
                suffixIcon: Text(
                  "Strong",
                  style: TextStyle(
                    color: context.theme.colorScheme.secondary,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Email Address",
                labelStyle: labelTextStyle,
                enabledBorder: textFieldBorder,
                suffixIconConstraints: const BoxConstraints(),
                suffixIcon: SvgPicture.asset(
                  Assets.assetsCheckIcon,
                  alignment: Alignment.bottomCenter,
                  width: 10,
                  height: 10,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Remember me",
                    style: TextStyle(
                      fontFamily: "Manrope",
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                    child: Transform.scale(
                      scale: 0.6,
                      child: CupertinoSwitch(
                        value: true,
                        onChanged: (isChecked) {},
                      ),
                    ),
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

const labelTextStyle = TextStyle(
  color: subtitleColor,
  fontSize: 16,
);

const textFieldBorder = UnderlineInputBorder(
  borderSide: BorderSide(color: textFieldUnderlineColor),
);
