class AuthCredentials {
  final String email;
  final String password;
  String phoneNumber;
  String userId;

  AuthCredentials({
    this.email = '',
    this.password = '',
    this.phoneNumber = '',
    this.userId = '',
  });

  AuthCredentials copyWith({
    String email,
    String password,
    String phoneNumber,
    String userId,
  }) {
    return AuthCredentials(
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userId: userId ?? this.userId,
    );
  }
}
