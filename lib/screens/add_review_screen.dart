import 'package:figma_shopping_app/screens/address_screen.dart';
import 'package:figma_shopping_app/screens/onboarding_screen_scaffold.dart';
import 'package:flutter/material.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenScaffold(
      appbarTitle: "Add Review",
      buttonText: "Submit Review",
      onButtonClick: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddressScreen(),
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 200,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NameAndReview(
              nameOrReview: "Name",
              hintText: "Type Your Name",
              fieldHeight: 50,
            ),
            NameAndReview(
              nameOrReview: "How was your Experience ?",
              hintText: "Describe your Experience ?",
              fieldHeight: 200,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Star",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: RatingSlider(),
            ),
          ],
        ),
      ),
    );
  }
}

class NameAndReview extends StatelessWidget {
  const NameAndReview({
    super.key,
    required this.nameOrReview,
    required this.hintText,
    required this.fieldHeight,
  });

  final String nameOrReview, hintText;
  final double fieldHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nameOrReview,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: fieldHeight,
              child: Card(
                elevation: 8,
                color: const Color(0xFF8F959E),
                child: TextField(
                  expands: true,
                  minLines: null,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF8F959E),
                    ),
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RatingSlider extends StatefulWidget {
  const RatingSlider({super.key});

  @override
  State<RatingSlider> createState() => _RatingSliderState();
}

class _RatingSliderState extends State<RatingSlider> {
  double _currentSliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Slider(
        inactiveColor: const Color(0xFF8F959E),
        value: _currentSliderValue,
        max: 5.0,
        divisions: 5,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        });
  }
}
