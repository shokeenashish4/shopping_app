import 'package:figma_shopping_app/generated/assets.dart';
import 'package:figma_shopping_app/screens/onboarding_screen_scaffold.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenScaffold(
      appbarTitle: "Cart",
      buttonText: "Checkout",
      onButtonClick: () {},
      child: const Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: Column(
          children: [
            CartItem(
              itemName: "Men's Tie-Dye T-Shirt Nike Sportswear",
              itemPrice: "\$99 (+\$4.00 Tax)",
              itemQuantity: "1",
              iconRef: Assets.assetsImg1Screen11,
              elevation: 40,
            ),
            CartItem(
              itemName: "Men's Tie-Dye T-Shirt Nike Sportswear",
              itemPrice: "\$45 (+\$4.00 Tax)",
              itemQuantity: "1",
              iconRef: Assets.assetsImg2Screen11,
              elevation: 0,
              backgroundColor: Color(0xFFF5F6FA),
            ),
            // Delivery Address line
            AddressandPayment(
              addorPayField: "Delivery Address",
              icon: Icons.arrow_forward_ios_outlined,
              iconRef: Assets.assetsMapIcon,
              payNoOrAddress: "43, Electronics City Phase 1,Electronic City",
              checkImg: Assets.assetsCheckImgCart,
            ),
            // Payment Address
            AddressandPayment(
              addorPayField: "Payment Method",
              icon: Icons.arrow_forward_ios_outlined,
              iconRef: Assets.assetsVisaImg,
              payNoOrAddress: "**** 6789",
              checkImg: Assets.assetsCheckImgCart,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Order Info",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF8F959E),
                          ),
                        ),
                        Text(
                          "\$110",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Charge",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF8F959E),
                          ),
                        ),
                        Text(
                          "\$10",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF8F959E),
                          ),
                        ),
                        Text(
                          "\$120",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddressandPayment extends StatelessWidget {
  const AddressandPayment({
    super.key,
    required this.addorPayField,
    required this.icon,
    required this.iconRef,
    required this.payNoOrAddress,
    required this.checkImg,
  });

  final String addorPayField, iconRef, payNoOrAddress, checkImg;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                addorPayField,
                style: const TextStyle(
                  fontSize: 17,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                icon,
                size: 15,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Image.asset(iconRef),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 9,
                      bottom: 7,
                    ),
                    child: Text(
                      payNoOrAddress,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF8F959E),
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  checkImg,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String iconRef, itemName, itemPrice, itemQuantity;
  final double? elevation;
  final Color backgroundColor;

  const CartItem({
    super.key,
    required this.iconRef,
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
    this.elevation,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Card(
        clipBehavior: Clip.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: backgroundColor,
        surfaceTintColor: Colors.transparent,
        elevation: elevation,
        shadowColor: const Color(0xFF393F4A).withOpacity(0.25),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6FA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(iconRef),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                  top: 12,
                  bottom: 10,
                ),
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 150,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemName,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Inter",
                        ),
                      ),
                      Text(
                        itemPrice,
                        style: const TextStyle(
                          color: Color(0xFF8F959E),
                          fontSize: 11,
                          fontFamily: "Inter",
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xFF8F959E),
                              size: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              itemQuantity,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.keyboard_arrow_up_outlined,
                              color: Color(0xFF8F959E),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10, bottom: 28, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.delete_outline_outlined,
                    color: Color(0xFF8F959E),
                    size: 15,
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
