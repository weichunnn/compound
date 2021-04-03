class AuthRepository {
  // API simulation
  Future<void> login() async {
    print('Attempting login');
    await Future.delayed(Duration(seconds: 3));
    print('Login successful');
    throw Exception('Failed Log In');
  }
}
