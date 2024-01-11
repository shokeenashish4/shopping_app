import 'dart:async';

abstract class AuthRepository {
  Future<bool> isUserLoggedIn();

  Future<bool> login({required String username, required String password});

  Future<bool> signUp({
    required String username,
    required String password,
    required String email,
  });

  Future<bool> loginWithFacebook();

  Future<bool> loginWithGoogle();

  Future<bool> loginWithTwitter();

  Future<bool> resetPassword({
    required String email,
    required String password,
  });
}

class FakeAuthRepository extends AuthRepository {
  bool _isUserLogged = false;

  @override
  Future<bool> isUserLoggedIn() {
    return Future.delayed(const Duration(seconds: 3), () => _isUserLogged);
  }

  @override
  Future<bool> login({required String username, required String password}) {
    final wasLoginSuccess =
        username == "shokeenashish7" && password == "AshishShokeen@1";
    _isUserLogged = wasLoginSuccess;
    return Future(() => wasLoginSuccess);
  }

  @override
  Future<bool> signUp({
    required String username,
    required String password,
    required String email,
  }) {
    final wasSignUpSuccess = username == "shokeenashish7" &&
        password == "AshishShokeen@1" &&
        email == "test@gmail.com";
    _isUserLogged = wasSignUpSuccess;
    return Future.delayed(const Duration(seconds: 3), () => wasSignUpSuccess);
  }

  @override
  Future<bool> loginWithFacebook() {
    return Future.delayed(
      const Duration(seconds: 3),
      () => true,
    );
  }

  @override
  Future<bool> loginWithGoogle() {
    return Future.delayed(
      const Duration(seconds: 3),
      () => true,
    );
  }

  @override
  Future<bool> loginWithTwitter() {
    return Future.delayed(
      const Duration(seconds: 3),
      () => true,
    );
  }

  @override
  Future<bool> resetPassword(
      {required String email, required String password}) {
    final isResetSuccess =
        email == "test@gmail.com" && password == "AshishShokeen@1";
    _isUserLogged = isResetSuccess;
    return Future.delayed(const Duration(seconds: 3), () => isResetSuccess);
  }
}
