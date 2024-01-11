import 'package:figma_shopping_app/data/models/brand_preview.dart';
import 'package:figma_shopping_app/data/models/product.dart';
import 'package:figma_shopping_app/data/repositories/product_repository.dart';
import 'package:figma_shopping_app/di.dart';
import 'package:figma_shopping_app/generated/assets.dart';
import 'package:figma_shopping_app/ui/screens/add_card_screen.dart';
import 'package:figma_shopping_app/ui/screens/brand_products_screen.dart';
import 'package:figma_shopping_app/ui/screens/dashboard/cart_screen.dart';
import 'package:figma_shopping_app/ui/screens/onboarding/forgot_pwd_screen.dart';
import 'package:figma_shopping_app/ui/screens/onboarding/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dashboard/wishlist_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int drawerItemSelectedIndex = 1;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  late final List<Widget> _drawerWidgetOptions;

  @override
  void initState() {
    _drawerWidgetOptions = <Widget>[
      const Text("Dark Mode Button"),
      HomeScreen(scaffoldKey: scaffoldKey),
      const Text("Account Info Screen"),
      const ForgotPwdScreen(),
      const CartScreen(),
      const AddCardScreen(),
      WishlistScreen(
        scaffoldKey: scaffoldKey,
      ),
      const Text("Settings Page"),
      const LoginScreen(),
    ];
    super.initState();
  }

  void drawerItemTapped(int index) {
    scaffoldKey.currentState?.closeDrawer();
    setState(() {
      drawerItemSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: _drawerWidgetOptions[drawerItemSelectedIndex],
      ),
      drawer: Drawer(
        surfaceTintColor: Colors.transparent,
        elevation: 5,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      scaffoldKey.currentState?.closeDrawer();
                    },
                    icon: Image.asset(Assets.assetsSideDrawerImg),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Row(
                      children: [
                        Image.asset(Assets.assetsDrawerDpImg),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Hemendra",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  fontFamily: "Inter",
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Verified Profile",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF8F959E),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    Assets.assetsDrawerGreenCheck,
                                    width: 15,
                                    height: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Text(
                                  " 2 Orders",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF8F959E),
                                  ),
                                  textAlign: TextAlign.center,
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
            ListTile(
              title: const ListItem(
                assetImage: Assets.assetsDrawerSunImg,
                tileText: "Dark Mode",
                textColor: Colors.black,
                wantCupertinoSwitch: true,
              ),
              selected: drawerItemSelectedIndex == 0,
              onTap: () {
                drawerItemTapped(0);
              },
            ),
            ListTile(
              title: const ListItem(
                assetImage: Assets.assetsNavigationHomeImg,
                tileText: "Home",
                textColor: Colors.black,
                imgWidth: 25,
                imgHeight: 25,
              ),
              selected: drawerItemSelectedIndex == 1,
              onTap: () {
                drawerItemTapped(1);
              },
            ),
            ListTile(
              title: const ListItem(
                assetImage: Assets.assetsDrawerInfoCircle,
                tileText: 'Account Information',
                textColor: Colors.black,
              ),
              selected: drawerItemSelectedIndex == 2,
              onTap: () {
                drawerItemTapped(2);
              },
            ),
            ListTile(
              title: const ListItem(
                assetImage: Assets.assetsDrawerLockImg,
                tileText: 'Password',
                textColor: Colors.black,
              ),
              selected: drawerItemSelectedIndex == 3,
              onTap: () {
                drawerItemTapped(3);
              },
            ),
            ListTile(
              title: const ListItem(
                assetImage: Assets.assetsDrawerBagImg,
                tileText: 'Order',
                textColor: Colors.black,
              ),
              selected: drawerItemSelectedIndex == 4,
              onTap: () {
                drawerItemTapped(4);
              },
            ),
            ListTile(
              title: const ListItem(
                assetImage: Assets.assetsDrawerWalletImg,
                tileText: 'My Cards',
                textColor: Colors.black,
              ),
              selected: drawerItemSelectedIndex == 5,
              onTap: () {
                drawerItemTapped(5);
              },
            ),
            ListTile(
              title: const ListItem(
                assetImage: Assets.assetsDrawerHeartImg,
                tileText: 'Wishlist',
                textColor: Colors.black,
              ),
              selected: drawerItemSelectedIndex == 6,
              onTap: () {
                drawerItemTapped(6);
              },
            ),
            ListTile(
              title: const ListItem(
                assetImage: Assets.assetsDrawerSettingsImg,
                tileText: 'Settings',
                textColor: Colors.black,
              ),
              selected: drawerItemSelectedIndex == 7,
              onTap: () {
                drawerItemTapped(7);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: ListTile(
                title: const ListItem(
                  assetImage: Assets.assetsDrawerLogoutImg,
                  tileText: 'Logout',
                  textColor: Color(0xFFFF5757),
                ),
                selected: drawerItemSelectedIndex == 8,
                onTap: () {
                  drawerItemTapped(8);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.assetImage,
    required this.tileText,
    required this.textColor,
    this.wantCupertinoSwitch = false,
    this.imgColor,
    this.imgWidth,
    this.imgHeight,
  });

  final String assetImage;
  final double? imgWidth, imgHeight, imgColor;
  final String tileText;
  final Color textColor;
  final bool? wantCupertinoSwitch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Image.asset(
            assetImage,
            width: imgWidth,
            height: imgHeight,
            color: Colors.black,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                tileText,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
            ),
          ),
          if (wantCupertinoSwitch == true)
            CupertinoSwitch(
              value: false,
              onChanged: (isChecked) {},
            ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const HomeScreen({super.key, required this.scaffoldKey});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final productRepo = di<ProductRepository>();
  List<BrandPreview> brandPreviews = [];
  List<Product> products = [];
  List<String> wishlistedProductIds = [];

  @override
  void initState() {
    fetchBrandPreviews();
    fetchNewArrivalProducts();
    super.initState();
  }

  void fetchBrandPreviews() {
    productRepo.getBrandPreviews().then((value) {
      setState(() {
        brandPreviews = value;
      });
    });
  }

  void fetchNewArrivalProducts() {
    productRepo.getNewArrivalProducts().then((value) {
      setState(() {
        products = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 5,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
              icon: Image.asset(Assets.assetsCartImg),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontFamily: "Inter",
            color: Colors.black,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hello",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  "Welcome to Shopping App",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color(0xFF8F959E),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 0,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Search",
                          hintStyle: const TextStyle(
                            color: Color(0xFF8F959E),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              top: 16,
                              bottom: 16,
                              right: 8,
                            ),
                            child: SvgPicture.asset(Assets.assetsSearchIcon),
                          ),
                          prefixIconColor: const Color(0xFF8F959E),
                          fillColor: const Color(0xFFF5F5F5),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(Assets.assetsVoiceButton),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Choose Brand",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Color(0xFF8F959E),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: brandPreviews.length,
                  itemBuilder: (context, index) {
                    final brand = brandPreviews[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 5,
                        top: 15,
                        bottom: 15,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  BrandProductsScreen(brandName: brand.name),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 5,
                            ),
                            child: Row(
                              children: [
                                Image.asset(brand.logoUrl),
                                Text(brand.name),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Arrival",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Color(0xFF8F959E),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.6,
                      mainAxisSpacing: 9,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                product.url,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 122),
                                child: InkWell(
                                  onTap: () {
                                    if (wishlistedProductIds
                                        .contains(product.id)) {
                                      setState(() {
                                        wishlistedProductIds.remove(product.id);
                                      });
                                    } else {
                                      setState(() {
                                        wishlistedProductIds.add(product.id);
                                      });
                                    }
                                  },
                                  child: wishlistedProductIds
                                              .contains(product.id) ==
                                          false
                                      ? Image.asset(Assets.assetsHeartImg)
                                      : Image.asset(
                                          Assets.assetsRedHeartImg,
                                          width: 20,
                                          height: 20,
                                        ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: FractionallySizedBox(
                              widthFactor: 0.8,
                              child: Text(
                                "${product.title}\n",
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ),
                          Text(
                            product.price,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
