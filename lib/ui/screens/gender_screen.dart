import 'package:figma_shopping_app/generated/assets.dart';
import 'package:figma_shopping_app/ui/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? buttonSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF9775FA),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 30),
        child: Column(
          children: [
            Image.asset(Assets.assetsGenderScreenImage),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      const Text(
                        "Look Good, Feel Good",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          fontFamily: "Inter-SemiBold",
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        child: Text(
                          "Create your individual & unique style and look amazing everyday",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF8F959E),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SelectableButton(
                              isSelected: buttonSelected == "Female",
                              buttonText: "Female",
                              onTap: () =>
                                  setState(() => buttonSelected = "Female"),
                            ),
                            SelectableButton(
                              isSelected: buttonSelected == "Male",
                              buttonText: "Male",
                              onTap: () =>
                                  setState(() => buttonSelected = "Male"),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          const Center(child: CircularProgressIndicator());
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return const DashboardScreen();
                            }),
                          );
                        },
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF8F959E),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectableButton extends StatelessWidget {
  const SelectableButton({
    super.key,
    required this.isSelected,
    this.selectedColor = const Color(0xFF9775FA),
    this.unSelectedColor = const Color(0xFFF5F6FA),
    this.selectedTextColor = Colors.white,
    this.unSelectedTextColor = const Color(0xFF8F959E),
    required this.buttonText,
    required this.onTap,
  });

  final bool isSelected;
  final Color selectedColor,
      unSelectedColor,
      selectedTextColor,
      unSelectedTextColor;
  final String buttonText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: buttonText == "Female" ? 15 : 5,
          right: buttonText == "Female" ? 5 : 15,
        ),
        child: ElevatedButton(
          onPressed: () {
            onTap();
            Future.delayed(
              const Duration(seconds: 2),
              () {
                const Center(child: CircularProgressIndicator());
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DashboardScreen(),
                  ),
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromHeight(60),
            backgroundColor: isSelected ? selectedColor : unSelectedColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              color: isSelected ? selectedTextColor : unSelectedTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
