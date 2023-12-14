import 'package:figma_shopping_app/generated/assets.dart';
import 'package:figma_shopping_app/screens/onboarding_screen_scaffold.dart';
import 'package:figma_shopping_app/screens/order_confirmed_screen.dart';
import 'package:flutter/material.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  String? selectedCardName;

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenScaffold(
      appbarTitle: "Add New Card",
      buttonText: "Add Card",
      onButtonClick: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OrderConfirmedScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 160),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
            color: Colors.black,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectableAssetImage(
                    onTap: () {
                      setState(() {
                        selectedCardName = "mastercard";
                      });
                    },
                    asset: Assets.assetsMasterCardLogo,
                    isSelected: selectedCardName == "mastercard",
                    selectedBackgroundColor: const Color(0xFFFFEEE3),
                    selectedBorderColor: const Color(0xFFFF5F00),
                  ),
                  SelectableAssetImage(
                    onTap: () {
                      setState(() {
                        selectedCardName = "paypal";
                      });
                    },
                    asset: Assets.assetsPaypalCardLogo,
                    isSelected: selectedCardName == "paypal",
                    selectedBackgroundColor: const Color(0xFFCDD5F4),
                    selectedBorderColor: const Color(0xFF849AEF),
                  ),
                  SelectableAssetImage(
                    onTap: () {
                      setState(() {
                        selectedCardName = "other";
                      });
                    },
                    asset: Assets.assetsOtherBankCard,
                    isSelected: selectedCardName == "other",
                    selectedBackgroundColor: const Color(0xFFD8D9E0),
                    selectedBorderColor: const Color(0xFF000000),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text("Card Owner"),
              ),
              const InputField(),
              const Text("Card Number"),
              const InputField(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("EXP"),
                          InputField(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CVV"),
                          InputField(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF5F6FA),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        maxLines: null,
      ),
    );
  }
}

class SelectableAssetImage extends StatelessWidget {
  final String asset;
  final void Function() onTap;
  final bool isSelected;
  final Color selectedBackgroundColor,
      selectedBorderColor,
      unselectedBackgroundColor;

  const SelectableAssetImage({
    super.key,
    required this.asset,
    required this.onTap,
    required this.isSelected,
    required this.selectedBackgroundColor,
    required this.selectedBorderColor,
    this.unselectedBackgroundColor = const Color(0xFFF5F6FA),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? selectedBackgroundColor : unselectedBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: isSelected ? Border.all(color: selectedBorderColor) : null,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          width: 100,
          height: 50,
          asset,
        ),
      ),
    );
  }
}
