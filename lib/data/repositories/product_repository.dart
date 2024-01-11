import 'dart:async';

import 'package:figma_shopping_app/data/models/brand_preview.dart';
import 'package:figma_shopping_app/data/models/product.dart';
import 'package:figma_shopping_app/generated/assets.dart';

abstract class ProductRepository {
  Future<List<BrandPreview>> getBrandPreviews();

  Future<List<Product>> getNewArrivalProducts();

  Future<List<Product>> getBrandProducts(String brandName);

  Future<List<Product>> getWishlistProducts();
}

class FakeProductsRepository extends ProductRepository {
  final List<Product> _allProducts = [
    const Product(
      id: "1",
      brandName: "Nike",
      title: "Nike Sportswear Club Fleece",
      price: "\$99",
      url: "assets/product_card1.png",
    ),
    const Product(
      id: "2",
      brandName: "Fila",
      title: "Trail Running Jacket Fila Windrunner",
      price: "\$99",
      url: "assets/product_card2.png",
    ),
    const Product(
      id: "3",
      brandName: "Puma",
      title: "Training Top Puma Sport Clash",
      price: "\$99",
      url: "assets/product_card3.png",
    ),
    const Product(
      id: "4",
      brandName: "Fila",
      title: "Trail Running Jacket Fila Windrunner",
      price: "\$99",
      url: "assets/product_card4.png",
    ),
    const Product(
      id: "5",
      brandName: "Puma",
      title: "Training Top Puma Sport Clash",
      price: "\$100",
      url: "assets/product_card5.png",
    ),
    const Product(
      id: "6",
      brandName: "Nike",
      title: "Trail Running Jacket Nike Windrunner",
      price: "\$70",
      url: "assets/product_card6.png",
    ),
  ];

  @override
  Future<List<BrandPreview>> getBrandPreviews() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        const BrandPreview(name: "Adidas", logoUrl: Assets.assetsAdidasLogo),
        const BrandPreview(name: "Nike", logoUrl: Assets.assetsNikeLogo),
        const BrandPreview(name: "Fila", logoUrl: Assets.assetsFilaLogo),
        const BrandPreview(name: "Puma", logoUrl: Assets.assetsPumaLogo),
      ],
    );
  }

  @override
  Future<List<Product>> getBrandProducts(String brandName) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => _allProducts
          .where((element) => element.brandName == brandName)
          .toList(),
    );
  }

  @override
  Future<List<Product>> getNewArrivalProducts() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        const Product(
          id: "1",
          brandName: "Nike",
          title: "Nike Sportswear Club Fleece",
          price: "\$99",
          url: "assets/product_card1.png",
        ),
        const Product(
          id: "2",
          brandName: "Fila",
          title: "Trail Running Jacket Fila Windrunner",
          price: "\$99",
          url: "assets/product_card2.png",
        ),
        const Product(
          id: "3",
          brandName: "Puma",
          title: "Training Top Puma Sport Clash",
          price: "\$99",
          url: "assets/product_card3.png",
        ),
        const Product(
          id: "4",
          brandName: "Fila",
          title: "Trail Running Jacket Fila Windrunner",
          price: "\$99",
          url: "assets/product_card4.png",
        ),
        const Product(
          id: "5",
          brandName: "Puma",
          title: "Training Top Puma Sport Clash",
          price: "\$100",
          url: "assets/product_card5.png",
        ),
        const Product(
          id: "6",
          brandName: "Nike",
          title: "Trail Running Jacket Nike Windrunner",
          price: "\$70",
          url: "assets/product_card6.png",
        ),
      ],
    );
  }

  @override
  Future<List<Product>> getWishlistProducts() {
    throw UnimplementedError();
  }
}
