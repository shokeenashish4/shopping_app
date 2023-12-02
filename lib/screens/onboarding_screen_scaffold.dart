import 'package:figma_shopping_app/colors.dart';
import 'package:figma_shopping_app/generated/assets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreenScaffold extends StatelessWidget {
  final String buttonText;
  final String? title, subtitle, lowerText, lowerTextAction, appbarTitle;
  final Widget child;
  final void Function() onButtonClick;
  final void Function()? onLowerTextActionClick;
  final bool showBackButton;
  final EdgeInsets lowerTextPadding;
  final bool showLowerTextActionInLeft;

  const OnboardingScreenScaffold({
    super.key,
    this.title,
    this.subtitle,
    this.lowerText,
    this.lowerTextAction,
    required this.buttonText,
    required this.child,
    required this.onButtonClick,
    this.onLowerTextActionClick,
    this.showBackButton = true,
    this.appbarTitle,
    this.lowerTextPadding = const EdgeInsets.only(bottom: 25),
    this.showLowerTextActionInLeft = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        leadingWidth: 80,
        leading: showBackButton
            ? IconButton(
                onPressed: Navigator.of(context).pop,
                icon: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F6FA),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(Assets.assetsArrowLeft),
                  ),
                ),
              )
            : null,
        title: appbarTitle != null
            ? Text(
                appbarTitle!,
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              )
            : null,
      ),
      body: Column(
        children: [
          if (title != null)
            Text(
              "$title",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 28,
                letterSpacing: -0.75,
              ),
            ),
          if (subtitle != null)
            Text(
              "$subtitle",
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF8F959E),
              ),
            ),
          Expanded(child: Center(child: SingleChildScrollView(child: child))),
          if (lowerText != null && lowerTextAction != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 15,
                    color: subtitleColor,
                  ),
                  children: [
                    TextSpan(text: "$lowerText "),
                    TextSpan(
                      text: lowerTextAction,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = onLowerTextActionClick,
                    ),
                  ],
                ),
              ),
            ),
          InkWell(
            enableFeedback: true,
            onTap: onButtonClick,
            child: Container(
              alignment: Alignment.center,
              height: 75,
              color: Theme.of(context).colorScheme.primary,
              child: Text(
                buttonText,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
