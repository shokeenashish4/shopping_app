import 'package:figma_shopping_app/data/models/product.dart';
import 'package:figma_shopping_app/data/repositories/product_repository.dart';
import 'package:figma_shopping_app/di.dart';
import 'package:figma_shopping_app/generated/assets.dart';
import 'package:figma_shopping_app/ui/screens/dashboard/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandProductsScreen extends StatefulWidget {
  const BrandProductsScreen({
    super.key,
    this.showBackButton = true,
    required this.brandName,
    this.isItemWishlisted,
  });

  final bool showBackButton;
  final String brandName;
  final bool? isItemWishlisted;

  @override
  State<BrandProductsScreen> createState() => _BrandProductsScreenState();
}

class _BrandProductsScreenState extends State<BrandProductsScreen> {
  final productRepo = di<ProductRepository>();
  List<Product> productList = [];
  List<String> wishlistedProductIds = [];

  @override
  void initState() {
    fetchBrandProducts(widget.brandName);
    super.initState();
  }

  void fetchBrandProducts(String brandName) {
    productRepo.getBrandProducts(brandName).then((value) {
      setState(() {
        productList = value;
      });
    });
  }

  String brandLogo() {
    switch (widget.brandName) {
      case 'Nike':
        return Assets.assetsNikeLogo;
      case 'Puma':
        return Assets.assetsPumaLogo;
      case 'Adidas':
        return Assets.assetsAdidasLogo;
      case 'Fila':
        return Assets.assetsFilaLogo;
      default:
        return Assets.assetsAdidasLogo; // We won't reach this case
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          brandLogo(),
        ),
        scrolledUnderElevation: 0,
        leadingWidth: 80,
        leading: widget.showBackButton
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
      body: DefaultTextStyle(
        style: const TextStyle(
          fontFamily: "Inter",
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${productList.length.toString()} Items",
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          "Available in Stock",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F6FA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Image.asset(Assets.assetsSortImg),
                              ),
                              const Text(
                                "Sort",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.6,
                    mainAxisSpacing: 9,
                    crossAxisSpacing: 15,
                  ),
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    final product = productList[index];
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
                                child:
                                    wishlistedProductIds.contains(product.id) ==
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
            ],
          ),
        ),
      ),
    );
  }
}

// final bool isSelected
// void function
