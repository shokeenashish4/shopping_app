import 'package:figma_shopping_app/colors.dart';
import 'package:figma_shopping_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreenScaffold extends StatelessWidget {
  final String title, buttonText;
  final String? subtitle, lowerText, lowerTextAction;
  final Widget child;
  final void Function() onButtonClick;
  final void Function()? onLowerTextActionClick;

  const OnboardingScreenScaffold({
    super.key,
    required this.title,
    this.subtitle,
    this.lowerText,
    this.lowerTextAction,
    required this.buttonText,
    required this.child,
    required this.onButtonClick,
    this.onLowerTextActionClick,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leadingWidth: 80,
        leading: IconButton(
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
        ),
      ),
      body: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 28,
              letterSpacing: -0.75,
            ),
          ),
          Expanded(child: Center(child: child)),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (lowerText != null)
                  Text(
                    "$lowerText ",
                    style: const TextStyle(
                      fontSize: 15,
                      color: subtitleColor,
                    ),
                  ),
                if (lowerTextAction != null)
                  InkWell(
                    enableFeedback: true,
                    onTap: onLowerTextActionClick,
                    child: Text(
                      lowerTextAction!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  )
              ],
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
