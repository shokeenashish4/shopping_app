import 'package:figma_shopping_app/data/repositories/auth_repository.dart';
import 'package:figma_shopping_app/data/repositories/product_repository.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

void setupDependencyInjection() {
  di.registerSingleton<AuthRepository>(FakeAuthRepository());
  di.registerSingleton<ProductRepository>(FakeProductsRepository());
}
