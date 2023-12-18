abstract class AuthRepository {
  bool isUserLoggedIn();

  bool login({required String username, required String password});

  bool signUp({
    required String username,
    required String password,
    required String email,
  });
}

class FakeAuthRepository extends AuthRepository {
  bool _isUserLogged = false;

  @override
  bool isUserLoggedIn() {
    return _isUserLogged;
  }

  @override
  bool login({required String username, required String password}) {
    final wasLoginSuccess =
        username == "shokeenashish7" && password == "AshishShokeen@1";
    _isUserLogged = wasLoginSuccess;
    return wasLoginSuccess;
  }

  @override
  bool signUp({
    required String username,
    required String password,
    required String email,
  }) {
    final wasSignUpSuccess = username == "shokeenashish7" &&
        password == "AshishShokeen@1" &&
        email == "test@gmail.com";
    _isUserLogged = wasSignUpSuccess;
    return wasSignUpSuccess;
  }
}
