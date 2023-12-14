abstract class AuthRepository {
  bool isUserLoggedIn();
}

class FakeAuthRepository extends AuthRepository {
  @override
  bool isUserLoggedIn() {
    return true;
  }
}
