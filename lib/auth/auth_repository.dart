class AuthRepository {
  Future<String> login() async {
    print('Attempting login');
    await Future.delayed(Duration(seconds: 3));
    print('Login successful');
    return 'abc';
  }

  Future<String> attemptAutoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    throw Exception('No Auto');
  }

  Future<void> signUp({
    String email,
    String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    print('Sign Up successful');
  }

  Future<void> confirmSignUp({
    String email,
    String otp,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    print('Confirmation successful');
  }

  Future<String> sendForgotPasswordOtp({
    String email,
  }) async {
    await Future.delayed(Duration(seconds: 3));
    return 'abc';
  }

  Future<String> resetForgotPassword({
    String password,
    String otp,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    return 'abc';
  }

  Future<void> signOut() async {
    await Future.delayed(Duration(seconds: 1));
  }
}
