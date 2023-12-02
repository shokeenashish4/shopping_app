import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:figma_shopping_app/generated/assets.dart';
import 'package:figma_shopping_app/screens/gender_screen.dart';
import 'package:figma_shopping_app/screens/onboarding/forgot_pwd_screen.dart';
import 'package:figma_shopping_app/screens/onboarding/signup_onboarding_screen.dart';
import 'package:figma_shopping_app/screens/onboarding_screen_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenScaffold(
      title: "Welcome",
      subtitle: "Please Enter your data to Continue",
      lowerText:
          "By Connecting your Account you confirm that you Agree with our",
      lowerTextAction: "Terms and Conditions",
      buttonText: "Login",
      onButtonClick: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const GenderScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const ForgotPwdScreen()),
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color(0xFFEA4335),
                      fontSize: 15,
                    ),
                  ),
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
