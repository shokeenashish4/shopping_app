import 'package:figma_shopping_app/data/auth_repository.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

void setupDependencyInjection() {
  di.registerFactory<AuthRepository>(() => FakeAuthRepository());
}
