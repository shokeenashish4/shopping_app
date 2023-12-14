import 'package:figma_shopping_app/generated/assets.dart';
import 'package:figma_shopping_app/screens/onboarding_screen_scaffold.dart';
import 'package:flutter/material.dart';

class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenScaffold(
      buttonText: "Continue Shopping",
      onButtonClick: () {},
      child: DefaultTextStyle(
        style: const TextStyle(
          fontFamily: "Inter",
          color: Color(0xFF000000),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 335.76,
              child: Image.asset(
                Assets.assetsOrderConfirmedImg,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 10),
                    child: Text(
                      "Order Confirmed!",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Text(
                    "Your order has been confirmed, we will send you confirmation email shortly.",
                    style: TextStyle(
                      color: Color(0xFF8F959E),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xFFF5F5F5),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Go to Orders",
                          style: TextStyle(
                            color: Color(0xFF8F959E),
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
