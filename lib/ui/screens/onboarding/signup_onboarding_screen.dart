import 'package:figma_shopping_app/data/auth_repository.dart';
import 'package:figma_shopping_app/di.dart';
import 'package:figma_shopping_app/generated/assets.dart';
import 'package:figma_shopping_app/ui/colors.dart';
import 'package:figma_shopping_app/ui/screens/gender_screen.dart';
import 'package:figma_shopping_app/ui/screens/onboarding_screen_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

bool checkEmail(String email) => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);

bool checkUsername(String username) => RegExp(r"^[a-z0-9]+").hasMatch(username);

bool checkPassword(String password) =>
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}')
        .hasMatch(password);

class SignupOnboardingScreen extends StatefulWidget {
  const SignupOnboardingScreen({super.key});

  @override
  State<SignupOnboardingScreen> createState() => _SignupOnboardingScreenState();
}

class _SignupOnboardingScreenState extends State<SignupOnboardingScreen> {
  final authRepo = di<AuthRepository>();
  bool? isUsernameValid;
  bool? isPasswordValid;
  bool? isEmailValid;
  bool showErrorMessage = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    usernameController.addListener(() {
      setState(() {
        isUsernameValid = checkUsername(usernameController.text);
      });
    });
    passwordController.addListener(() {
      setState(() {
        isPasswordValid = checkPassword(passwordController.text);
      });
    });
    emailController.addListener(() {
      setState(() {
        isEmailValid = checkEmail(emailController.text);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenScaffold(
      title: "Sign Up",
      buttonText: "Sign Up",
      onButtonClick: isUsernameValid == true &&
              isPasswordValid == true &&
              isEmailValid == true
          ? () async {
              setState(() {
                showErrorMessage = false;
              });

              final wasSignUpSuccess = authRepo.signUp(
                email: emailController.text,
                password: passwordController.text,
                username: usernameController.text,
              );

              if (await wasSignUpSuccess) {
                Future.delayed(
                  const Duration(seconds: 3),
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
                  showErrorMessage = true;
                });
              }
            }
          : null,
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
                suffixIcon: isUsernameValid != null
                    ? SvgPicture.asset(
                        isUsernameValid == true
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
                suffixIcon: isPasswordValid != null
                    ? SvgPicture.asset(
                        isPasswordValid == true
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
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email Address",
                labelStyle: labelTextStyle,
                enabledBorder: textFieldBorder,
                suffixIconConstraints: const BoxConstraints(),
                suffixIcon: isEmailValid != null
                    ? SvgPicture.asset(
                        isEmailValid == true
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
              const Text(
                "Sign Up Unsuccessful. Please check your values.",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
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
