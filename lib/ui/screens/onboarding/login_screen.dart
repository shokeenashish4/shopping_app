import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:figma_shopping_app/data/auth_repository.dart';
import 'package:figma_shopping_app/di.dart';
import 'package:figma_shopping_app/generated/assets.dart';
import 'package:figma_shopping_app/ui/screens/gender_screen.dart';
import 'package:figma_shopping_app/ui/screens/onboarding/forgot_pwd_screen.dart';
import 'package:figma_shopping_app/ui/screens/onboarding/signup_onboarding_screen.dart';
import 'package:figma_shopping_app/ui/screens/onboarding_screen_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authRepo = di<AuthRepository>();
  bool showErrorMessage = false;
  bool? isUsernameCorrect;
  bool? isPasswordCorrect;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void resetStates() {
    setState(() {
      showErrorMessage = false;
      isUsernameCorrect = null;
      isPasswordCorrect = null;
    });
  }

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
        resetStates();

        final wasLoginSuccess = authRepo.login(
          username: usernameController.text,
          password: passwordController.text,
        );

        if (wasLoginSuccess) {
          Future.delayed(
            const Duration(seconds: 2),
            () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const GenderScreen(),
                ),
              );
            },
          );
        } else {
          setState(() {
            isUsernameCorrect = false;
            isPasswordCorrect = false;
            showErrorMessage = true;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Username",
                labelStyle: labelTextStyle,
                enabledBorder: textFieldBorder,
                suffixIconConstraints: const BoxConstraints(),
                suffixIcon: isUsernameCorrect != null
                    ? SvgPicture.asset(
                        isUsernameCorrect == true
                            ? Assets.assetsCheckIcon
                            : Assets.assetsCrossIconImg,
                        alignment: Alignment.bottomCenter,
                        width: 10,
                        height: 10,
                      )
                    : null,
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: labelTextStyle,
                enabledBorder: textFieldBorder,
                suffixIconConstraints: const BoxConstraints(),
                suffixIcon: isPasswordCorrect != null
                    ? SvgPicture.asset(
                        isPasswordCorrect == true
                            ? Assets.assetsCheckIcon
                            : Assets.assetsCrossIconImg,
                        alignment: Alignment.bottomCenter,
                        width: 10,
                        height: 10,
                      )
                    : null,
              ),
            ),
            if (showErrorMessage)
              Text(
                "Login unsuccessful! Please check your username and password.",
                style: context.bodyLarge?.copyWith(color: Colors.red),
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
