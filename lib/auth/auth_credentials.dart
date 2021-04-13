class AuthCredentials {
  final String email;
  final String password;
  String userId;

  AuthCredentials({
    this.email = '',
    this.password = '',
    this.userId = '',
  });

  AuthCredentials copyWith({
    String email,
    String password,
    String userId,
  }) {
    return AuthCredentials(
      email: email ?? this.email,
      password: password ?? this.password,
      userId: userId ?? this.userId,
    );
  }
}
