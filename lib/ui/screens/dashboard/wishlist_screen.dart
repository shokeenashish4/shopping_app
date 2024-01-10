import 'package:figma_shopping_app/generated/assets.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const WishlistScreen({
    super.key,
    required this.scaffoldKey,
  });

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  int drawerItemSelectedIndex = 6;

  void drawerItemTapped(int index) {
    widget.scaffoldKey.currentState?.closeDrawer();
    setState(() {
      drawerItemSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leadingWidth: 75,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              widget.scaffoldKey.currentState?.openDrawer();
            },
            icon: Image.asset(Assets.assetsDrawerClosedImg),
          ),
        ),
      ),
      body: const SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Wishlist Screen"),
          ],
        ),
      ),
    );
  }
}
